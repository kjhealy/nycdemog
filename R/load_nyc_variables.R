#' Look up Census variables
#'
#' Convenience wrapper around [tidycensus::load_variables()] for browsing the
#' variable catalogues used by [get_nyc_acs()] and [get_nyc_decennial()]. The
#' result is identical to a direct `tidycensus` call; this function exists so
#' that all NYC-oriented Census helpers live in one place.
#'
#' @param year The year, or endyear, of the dataset.
#' @param dataset Dataset name. Common choices: `"acs5"`, `"pl"`, `"dhc"`,
#'   `"sf1"`. See [tidycensus::load_variables()] for the full list.
#' @param cache Whether to cache the variable table on disk for re-use across
#'   sessions. Defaults to `TRUE` (the opposite of the upstream default,
#'   because caching is almost always what you want during package work).
#'
#' @return A tibble of variable IDs, labels, and concepts.
#'
#' @examples
#' \dontrun{
#' acs <- load_nyc_variables(2023, "acs5")
#' dplyr::filter(acs, grepl("median household income", label, ignore.case = TRUE))
#' }
#'
#' @export
load_nyc_variables <- function(year, dataset, cache = TRUE) {
  tidycensus::load_variables(year = year, dataset = dataset, cache = cache)
}
