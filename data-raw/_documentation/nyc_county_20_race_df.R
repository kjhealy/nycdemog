#' New York City race and Hispanic origin by county, 2020
#'
#' Population counts for the five New York City counties (boroughs), broken
#' down by race and Hispanic origin. Sourced from the 2020 Decennial Census
#' PL 94-171 redistricting summary file. The county-level counterpart of
#' [nyc_block_20_race_df]. Joins to [nycmaps::nyc_boros_sf] via the
#' `county` column, which matches `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 25 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID (state + county).}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau, e.g.
#'     `"Kings County, New York"`.}
#'   \item{total_pop}{Total population of the county (PL summary variable
#'     `P1_001N`).}
#'   \item{white_alone}{Population reporting White alone (`P1_003N`).}
#'   \item{black_alone}{Population reporting Black or African American alone
#'     (`P1_004N`).}
#'   \item{aian_alone}{American Indian and Alaska Native alone (`P1_005N`).}
#'   \item{asian_alone}{Asian alone (`P1_006N`).}
#'   \item{hipi_alone}{Native Hawaiian and Other Pacific Islander alone
#'     (`P1_007N`).}
#'   \item{other_alone}{Some other race alone (`P1_008N`).}
#'   \item{two_or_more}{Two or more races (`P1_009N`).}
#'   \item{hispanic}{Hispanic or Latino population (`P2_002N`).}
#'   \item{non_hispanic}{Not Hispanic or Latino population (`P2_003N`).}
#'   \item{nh_white_alone}{Not Hispanic, White alone (`P2_005N`).}
#'   \item{nh_black_alone}{Not Hispanic, Black or African American alone
#'     (`P2_006N`).}
#'   \item{nh_aian_alone}{Not Hispanic, AIAN alone (`P2_007N`).}
#'   \item{nh_asian_alone}{Not Hispanic, Asian alone (`P2_008N`).}
#'   \item{nh_hipi_alone}{Not Hispanic, NHOPI alone (`P2_009N`).}
#'   \item{nh_other_alone}{Not Hispanic, some other race alone (`P2_010N`).}
#'   \item{nh_two_or_more}{Not Hispanic, two or more races (`P2_011N`).}
#'   \item{nh_white_prop}{Proportion of `total_pop` that is non-Hispanic White
#'     alone. `NA` when `total_pop == 0`.}
#'   \item{nh_black_prop}{Proportion non-Hispanic Black alone.}
#'   \item{nh_asian_prop}{Proportion non-Hispanic Asian alone.}
#'   \item{hispanic_prop}{Proportion Hispanic or Latino.}
#'   \item{nh_two_or_more_prop}{Proportion non-Hispanic two or more races.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, PL 94-171 Redistricting
#'   Data Summary File. Retrieved via [tidycensus::get_decennial()].
#'   <https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html>
#' @keywords datasets
"nyc_county_20_race_df"
