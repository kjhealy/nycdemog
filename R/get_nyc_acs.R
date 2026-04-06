#' Get American Community Survey data for New York City
#'
#' A thin wrapper around [tidycensus::get_acs()] that hard-codes the five
#' New York City counties, never downloads geometry, and returns a tidy
#' tibble keyed by `geoid` (lowercased) with a `county` column ready for
#' joining to the spatial objects in the `nycmaps` package.
#'
#' @param variables A character vector (optionally named) of Census variable
#'   IDs. See [load_nyc_variables()] or [tidycensus::load_variables()].
#' @param year ACS endyear. If `NULL` (the default), uses the
#'   [tidycensus::get_acs()] default, which is the most recent vintage that
#'   `tidycensus` supports.
#' @param geography Geographic level. One of `"tract"` (default) or
#'   `"block group"`. County-level requests are intentionally not supported
#'   here; use [tidycensus::get_acs()] directly if you need them.
#' @param survey ACS sample, passed to [tidycensus::get_acs()]. Defaults to
#'   `"acs5"`.
#' @param summary_var Optional summary (denominator) variable.
#' @param output `"wide"` (the default) or `"tidy"`. When `"wide"`, the
#'   `variable` column is pivoted out so each variable becomes its own
#'   column.
#' @param ... Additional arguments forwarded to [tidycensus::get_acs()].
#'
#' @return A tibble with `geoid` and `county` as the first two columns,
#'   followed by the requested variables. The ACS endyear actually used is
#'   stored in the `"acs_year"` attribute.
#'
#' @examples
#' \dontrun{
#' # Median household income, latest 5-year ACS, NYC tracts.
#' get_nyc_acs(c(med_hhinc = "B19013_001"))
#'
#' # Race and Hispanic origin, with total population as the denominator.
#' race_vars <- c(
#'   nh_white = "B03002_003",
#'   nh_black = "B03002_004",
#'   nh_asian = "B03002_006",
#'   hispanic = "B03002_012"
#' )
#' get_nyc_acs(race_vars, summary_var = "B03002_001")
#' }
#'
#' @seealso [get_nyc_decennial()], [load_nyc_variables()], [nyc_counties()]
#' @export
get_nyc_acs <- function(
  variables,
  year = NULL,
  geography = c("tract", "block group"),
  survey = "acs5",
  summary_var = NULL,
  output = c("wide", "tidy"),
  ...
) {
  geography <- rlang::arg_match(geography)
  output <- rlang::arg_match(output)
  check_census_key()

  year <- resolve_year(year, tidycensus::get_acs)

  result <- tidycensus::get_acs(
    geography = geography,
    variables = variables,
    year = year,
    survey = survey,
    state = "NY",
    county = nyc_counties(),
    summary_var = unname(summary_var),
    geometry = FALSE,
    output = "tidy",
    ...
  )

  result <- tidy_census_result(result, output = output)
  attr(result, "acs_year") <- year
  attr(result, "acs_survey") <- survey
  result
}
