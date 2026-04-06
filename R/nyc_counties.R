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
