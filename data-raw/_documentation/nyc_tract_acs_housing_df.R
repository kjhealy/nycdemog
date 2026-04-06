#' New York City housing units, tenure, and value by Census tract, ACS 5-year
#'
#' Housing-unit counts, occupancy, tenure, value, rent, and year built from
#' the 2020-2024 American Community Survey 5-year release for the five New
#' York City counties at the Census tract level. Each estimate is
#' accompanied by its 90% margin of error, with the suffix `_moe`. Joins to
#' [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 23 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
#'   \item{hu_total}{Total housing units (`B25001_001`).}
#'   \item{hu_occupied}{Occupied housing units (`B25002_002`).}
#'   \item{hu_vacant}{Vacant housing units (`B25002_003`).}
#'   \item{tenure_total}{Occupied housing units, tenure denominator
#'     (`B25003_001`).}
#'   \item{tenure_owner}{Owner-occupied units (`B25003_002`).}
#'   \item{tenure_renter}{Renter-occupied units (`B25003_003`).}
#'   \item{median_value}{Median value of owner-occupied housing units, dollars
#'     (`B25077_001`).}
#'   \item{median_gross_rent}{Median gross rent, dollars (`B25064_001`).}
#'   \item{median_year_built}{Median year structure built (`B25035_001`).}
#'   \item{hu_total_moe, hu_occupied_moe, hu_vacant_moe, tenure_total_moe,
#'     tenure_owner_moe, tenure_renter_moe, median_value_moe,
#'     median_gross_rent_moe, median_year_built_moe}{Margins of error for the
#'     corresponding estimates.}
#'   \item{owner_occupied_prop}{`tenure_owner / tenure_total`. `NA` when
#'     `tenure_total == 0`.}
#'   \item{vacancy_rate}{`hu_vacant / hu_total`. `NA` when `hu_total == 0`.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, tables B25001, B25002, B25003, B25035, B25064, B25077.
#'   Retrieved via [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_tract_acs_housing_df"
