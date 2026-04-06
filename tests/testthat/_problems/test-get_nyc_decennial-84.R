# Extracted from test-get_nyc_decennial.R:84

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "nycdemog", path = "..")
attach(test_env, warn.conflicts = FALSE)

# prequel ----------------------------------------------------------------------
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
    out <- tibble::tibble(
      GEOID = c("36061000100", "36047000100"),
      NAME = c("Tract 1, NY", "Tract 1, Kings"),
      variable = rep(var_names, each = 2L),
      value = seq_len(2L * length(var_names)) * 100
    )
    if (!is.null(summary_var)) {
      out$summary_value <- 1000
    }
    out
  }
}

# test -------------------------------------------------------------------------
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
