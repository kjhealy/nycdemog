#' Get Decennial Census data for New York City
#'
#' A thin wrapper around [tidycensus::get_decennial()] that hard-codes the
#' five New York City counties, never downloads geometry, and returns a tidy
#' tibble keyed by `geoid` (lowercased) with a `county` column ready for
#' joining to the spatial objects in the `nycmaps` package.
#'
#' @param variables A character vector (optionally named) of Census variable
#'   IDs. See [load_nyc_variables()] or [tidycensus::load_variables()].
#' @param year Decennial Census year. Defaults to `2020`. `2000` and `2010`
#'   are also accepted by `tidycensus`.
#' @param geography Geographic level. One of `"tract"` (default), `"block"`,
#'   `"block group"`, or `"county"`.
#' @param sumfile Census summary file. Defaults to `"pl"` (the redistricting
#'   file). For tract-level demographic and housing characteristics use
#'   `"dhc"`.
#' @param summary_var Optional summary (denominator) variable.
#' @param output `"wide"` (the default) or `"tidy"`.
#' @param ... Additional arguments forwarded to [tidycensus::get_decennial()].
#'
#' @return A tibble with `geoid` and `county` as the first two columns,
#'   followed by the requested variables. The Census year and sumfile used
#'   are stored in the `"decennial_year"` and `"decennial_sumfile"`
#'   attributes.
#'
#' @examples
#' \dontrun{
#' # 2020 PL 94-171 race and Hispanic origin at the block level.
#' race_vars <- c(
#'   nh_white = "P2_005N",
#'   nh_black = "P2_006N",
#'   nh_asian = "P2_008N",
#'   hispanic = "P2_002N"
#' )
#' get_nyc_decennial(
#'   race_vars,
#'   geography = "block",
#'   sumfile = "pl",
#'   summary_var = "P1_001N"
#' )
#'
#' # 2020 DHC household type at tract level.
#' get_nyc_decennial(
#'   c(family_hh = "H9_002N", nonfamily_hh = "H9_009N"),
#'   geography = "tract",
#'   sumfile = "dhc"
#' )
#'
#' # 2020 PL 94-171 total population, one row per borough.
#' get_nyc_decennial(
#'   c(total_pop = "P1_001N"),
#'   geography = "county",
#'   sumfile = "pl"
#' )
#' }
#'
#' @seealso [get_nyc_acs()], [load_nyc_variables()], [nyc_counties()]
#' @export
get_nyc_decennial <- function(
  variables,
  year = 2020,
  geography = c("tract", "block", "block group", "county"),
  sumfile = "pl",
  summary_var = NULL,
  output = c("wide", "tidy"),
  ...
) {
  geography <- rlang::arg_match(geography)
  output <- rlang::arg_match(output)
  check_census_key()

  result <- tidycensus::get_decennial(
    geography = geography,
    variables = variables,
    year = year,
    sumfile = sumfile,
    state = "NY",
    county = nyc_counties(),
    summary_var = unname(summary_var),
    geometry = FALSE,
    output = "tidy",
    ...
  )

  result <- tidy_census_result(result, output = output)
  attr(result, "decennial_year") <- year
  attr(result, "decennial_sumfile") <- sumfile
  result
}
