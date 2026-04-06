# Extracted from test-get_nyc_acs.R:86

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "nycdemog", path = "..")
attach(test_env, warn.conflicts = FALSE)

# prequel ----------------------------------------------------------------------
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
    n <- 2L
    out <- tibble::tibble(
      GEOID = c("36061000100", "36047000100"),
      NAME = c("Tract 1, NY", "Tract 1, Kings"),
      variable = rep(var_names, each = n),
      estimate = seq_len(n * length(var_names)) * 100,
      moe = seq_len(n * length(var_names)) * 10
    )
    if (!is.null(summary_var)) {
      out$summary_est <- 1000
      out$summary_moe <- 50
    }
    out
  }
}

# test -------------------------------------------------------------------------
withr::local_envvar(CENSUS_API_KEY = "fake")
env <- new.env()
testthat::local_mocked_bindings(
  get_acs = make_fake_get_acs(env),
  .package = "tidycensus"
)
res <- get_nyc_acs(c(med_hhinc = "B19013_001", per_cap = "B19301_001"))
