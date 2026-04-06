# Helper: a fake tidycensus::get_acs that captures the call and returns a
# minimal tidy-shaped tibble. The captured args are stashed in `last_call`
# in the parent environment so each test can introspect them.
make_fake_get_acs <- function(env) {
  function(
    geography,
    variables = NULL,
    table = NULL,
    cache_table = FALSE,
    year = 2024,
    output = "tidy",
    state = NULL,
    county = NULL,
    zcta = NULL,
    geometry = FALSE,
    keep_geo_vars = FALSE,
    shift_geo = FALSE,
    summary_var = NULL,
    key = NULL,
    moe_level = 90,
    survey = "acs5",
    show_call = FALSE,
    ...
  ) {
    env$last_call <- list(
      geography = geography,
      variables = variables,
      year = year,
      state = state,
      county = county,
      geometry = geometry,
      summary_var = summary_var,
      survey = survey,
      output = output
    )
    var_names <- if (is.null(names(variables))) variables else names(variables)
    n_geo <- 2L
    n_var <- length(var_names)
    out <- tibble::tibble(
      GEOID = rep(c("36061000100", "36047000100"), times = n_var),
      NAME = rep(c("Tract 1, NY", "Tract 1, Kings"), times = n_var),
      variable = rep(var_names, each = n_geo),
      estimate = seq_len(n_geo * n_var) * 100,
      moe = seq_len(n_geo * n_var) * 10
    )
    if (!is.null(summary_var)) {
      out$summary_est <- 1000
      out$summary_moe <- 50
    }
    out
  }
}

test_that("get_nyc_acs aborts cleanly when no API key is set", {
  withr::local_envvar(CENSUS_API_KEY = "")
  expect_error(
    get_nyc_acs("B19013_001"),
    regexp = "No Census API key"
  )
})

test_that("get_nyc_acs hard-codes NY state, NYC counties, and no geometry", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_acs = make_fake_get_acs(env),
    .package = "tidycensus"
  )

  res <- get_nyc_acs(c(med_hhinc = "B19013_001"))

  expect_equal(env$last_call$state, "NY")
  expect_setequal(env$last_call$county, nyc_counties())
  expect_false(env$last_call$geometry)
  expect_equal(env$last_call$geography, "tract")
  expect_equal(env$last_call$survey, "acs5")
})

test_that("get_nyc_acs returns wide tidy output keyed on geoid", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_acs = make_fake_get_acs(env),
    .package = "tidycensus"
  )

  res <- get_nyc_acs(c(med_hhinc = "B19013_001", per_cap = "B19301_001"))

  expect_s3_class(res, "tbl_df")
  expect_equal(names(res)[1:2], c("geoid", "county"))
  expect_true(all(
    c("med_hhinc", "med_hhinc_moe", "per_cap", "per_cap_moe") %in% names(res)
  ))
  expect_setequal(res$county, c("New York", "Kings"))
  expect_identical(attr(res, "acs_survey"), "acs5")
})

test_that("get_nyc_acs unnames a named summary_var before forwarding", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_acs = make_fake_get_acs(env),
    .package = "tidycensus"
  )

  get_nyc_acs(
    c(nh_white = "B03002_003"),
    summary_var = c(total_pop = "B03002_001")
  )

  expect_null(names(env$last_call$summary_var))
  expect_equal(unname(env$last_call$summary_var), "B03002_001")
})

test_that("get_nyc_acs respects an explicit year", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_acs = make_fake_get_acs(env),
    .package = "tidycensus"
  )

  res <- get_nyc_acs(c(x = "B19013_001"), year = 2022)
  expect_equal(env$last_call$year, 2022)
  expect_equal(attr(res, "acs_year"), 2022)
})
