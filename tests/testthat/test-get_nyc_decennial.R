# Helper: a fake tidycensus::get_decennial that captures the call.
make_fake_get_decennial <- function(env) {
  function(
    geography,
    variables = NULL,
    table = NULL,
    cache_table = FALSE,
    year = 2020,
    sumfile = NULL,
    state = NULL,
    county = NULL,
    geometry = FALSE,
    output = "tidy",
    keep_geo_vars = FALSE,
    shift_geo = FALSE,
    summary_var = NULL,
    pop_group = NULL,
    pop_group_label = FALSE,
    key = NULL,
    show_call = FALSE,
    ...
  ) {
    env$last_call <- list(
      geography = geography,
      variables = variables,
      year = year,
      sumfile = sumfile,
      state = state,
      county = county,
      geometry = geometry,
      summary_var = summary_var,
      output = output
    )
    var_names <- if (is.null(names(variables))) variables else names(variables)
    n_var <- length(var_names)
    out <- tibble::tibble(
      GEOID = rep(c("36061000100", "36047000100"), times = n_var),
      NAME = rep(c("Tract 1, NY", "Tract 1, Kings"), times = n_var),
      variable = rep(var_names, each = 2L),
      value = seq_len(2L * n_var) * 100
    )
    if (!is.null(summary_var)) {
      out$summary_value <- 1000
    }
    out
  }
}

test_that("get_nyc_decennial aborts cleanly when no API key is set", {
  withr::local_envvar(CENSUS_API_KEY = "")
  expect_error(
    get_nyc_decennial("P1_001N"),
    regexp = "No Census API key"
  )
})

test_that("get_nyc_decennial hard-codes NY state, NYC counties, and no geometry", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_decennial = make_fake_get_decennial(env),
    .package = "tidycensus"
  )

  res <- get_nyc_decennial(c(total_pop = "P1_001N"))

  expect_equal(env$last_call$state, "NY")
  expect_setequal(env$last_call$county, nyc_counties())
  expect_false(env$last_call$geometry)
  expect_equal(env$last_call$year, 2020)
  expect_equal(env$last_call$sumfile, "pl")
})

test_that("get_nyc_decennial returns wide output with single value column", {
  withr::local_envvar(CENSUS_API_KEY = "fake")
  env <- new.env()
  testthat::local_mocked_bindings(
    get_decennial = make_fake_get_decennial(env),
    .package = "tidycensus"
  )

  res <- get_nyc_decennial(
    c(white = "P1_003N", black = "P1_004N"),
    summary_var = c(total_pop = "P1_001N")
  )

  expect_s3_class(res, "tbl_df")
  expect_equal(names(res)[1:2], c("geoid", "county"))
  expect_true(all(c("white", "black") %in% names(res)))
  expect_false(any(grepl("^value_", names(res))))
  expect_true("summary_value" %in% names(res))
  expect_null(names(env$last_call$summary_var))
  expect_identical(attr(res, "decennial_sumfile"), "pl")
})
