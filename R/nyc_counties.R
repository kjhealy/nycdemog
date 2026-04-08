#' New York City county names
#'
#' The five counties (boroughs) that make up New York City, in the form
#' expected by [tidycensus::get_acs()] and [tidycensus::get_decennial()]
#' (i.e. county *names*, not FIPS codes).
#'
#' @return A character vector of length 5: `"New York"`, `"Kings"`,
#'   `"Queens"`, `"Bronx"`, `"Richmond"`.
#'
#' @examples
#' nyc_counties()
#'
#' @export
nyc_counties <- function() {
  c("New York", "Kings", "Queens", "Bronx", "Richmond")
}

#' County FIPS codes for the five New York City counties
#'
#' Returned as a named character vector. Useful for filtering or validating
#' `geoid` columns whose first five characters encode the state + county
#' FIPS.
#'
#' @return A named character vector of length 5.
#'
#' @examples
#' nyc_county_fips()
#'
#' @export
nyc_county_fips <- function() {
  c(
    "New York" = "36061",
    "Kings" = "36047",
    "Queens" = "36081",
    "Bronx" = "36005",
    "Richmond" = "36085"
  )
}

#' New York City Public Use Microdata Areas (PUMAs)
#'
#' Returns the NYC PUMAs for a given vintage, each labelled with the
#' borough (as a county name, matching the convention used elsewhere in
#' this package) they fall in. NYC has 55 PUMAs in both the 2010 and
#' 2020 vintages; the borough assignment was derived from a largest-
#' overlap spatial join between `nycmaps::nyc_pumas_*_sf` and
#' `nycmaps::nyc_boros_sf` and hard-coded into the package.
#'
#' The 2010 vintage applies to ACS end-years up to and including 2021;
#' the 2020 vintage applies to ACS end-years 2022 and later.
#'
#' @param vintage PUMA vintage. One of `"2020"` (default) or `"2010"`.
#'
#' @return A tibble with columns `puma` (5-character PUMA code),
#'   `geoid` (7-character state + PUMA code, as returned by
#'   `tidycensus`), and `county` (borough name as a county, e.g.
#'   `"Kings"`).
#'
#' @examples
#' nyc_pumas()
#' nyc_pumas("2010")
#'
#' @export
nyc_pumas <- function(vintage = c("2020", "2010")) {
  vintage <- rlang::arg_match(vintage)
  out <- nyc_pumas_xwalk[nyc_pumas_xwalk$vintage == vintage, , drop = FALSE]
  out <- out[, c("puma", "geoid", "county")]
  tibble::as_tibble(out)
}
