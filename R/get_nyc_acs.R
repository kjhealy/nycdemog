#' Get American Community Survey data for New York City
#'
#' A thin wrapper around [tidycensus::get_acs()] that hard-codes New York
#' City geographies, never downloads geometry, and returns a tidy tibble
#' keyed by `geoid` (lowercased) with a `county` column (borough name) ready
#' for joining to the spatial objects in the `nycmaps` package.
#'
#' @param variables A character vector (optionally named) of Census variable
#'   IDs. See [load_nyc_variables()] or [tidycensus::load_variables()].
#' @param year ACS endyear. If `NULL` (the default), uses the
#'   [tidycensus::get_acs()] default, which is the most recent vintage that
#'   `tidycensus` supports.
#' @param geography Geographic level. One of `"tract"` (default),
#'   `"block group"`, `"county"`, or `"puma"`. For `"tract"`,
#'   `"block group"`, and `"county"` the request is restricted to the five
#'   NYC counties via `tidycensus`'s `county` argument. For `"puma"`,
#'   `tidycensus` does not accept a `county` filter, so all NY state PUMAs
#'   are requested and then filtered down to the 55 NYC PUMAs using an
#'   internal crosswalk. The crosswalk vintage is chosen from `year`: ACS
#'   endyears up to and including 2021 use the 2010 PUMA vintage, 2022 and
#'   later use the 2020 vintage. See [nyc_pumas()].
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
#' # Same, but at the PUMA level.
#' get_nyc_acs(
#'   c(med_hhinc = "B19013_001"),
#'   geography = "puma"
#' )
#'
#' # Same, but one row per borough.
#' get_nyc_acs(
#'   c(med_hhinc = "B19013_001"),
#'   geography = "county"
#' )
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
#' @seealso [get_nyc_decennial()], [load_nyc_variables()], [nyc_counties()],
#'   [nyc_pumas()]
#' @export
get_nyc_acs <- function(
  variables,
  year = NULL,
  geography = c("tract", "block group", "county", "puma"),
  survey = "acs5",
  summary_var = NULL,
  output = c("wide", "tidy"),
  ...
) {
  geography <- rlang::arg_match(geography)
  output <- rlang::arg_match(output)
  check_census_key()

  year <- resolve_year(year, tidycensus::get_acs)

  result <- if (geography == "puma") {
    tidycensus::get_acs(
      geography = "puma",
      variables = variables,
      year = year,
      survey = survey,
      state = "NY",
      summary_var = unname(summary_var),
      geometry = FALSE,
      output = "tidy",
      ...
    )
  } else {
    tidycensus::get_acs(
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
  }

  result <- tidy_census_result(
    result,
    output = output,
    geography = geography,
    vintage = puma_vintage_for_year(year)
  )
  attr(result, "acs_year") <- year
  attr(result, "acs_survey") <- survey
  result
}
