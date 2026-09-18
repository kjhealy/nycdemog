#' New York City income, poverty, and inequality by county, ACS 5-year
#'
#' Income, poverty, and inequality estimates from the 2020-2024 American
#' Community Survey 5-year release for the five New York City counties
#' (boroughs). Each estimate is accompanied by its 90% margin of error, with
#' the suffix `_moe`. The county-level counterpart of
#' [nyc_tract_acs_income_df]. Joins to [nycmaps::nyc_boros_sf] via the
#' `county` column, which matches `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 16 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{med_hhinc}{Median household income, inflation-adjusted dollars
#'     (`B19013_001`).}
#'   \item{med_family_income}{Median family income (`B19113_001`).}
#'   \item{per_capita_income}{Per capita income (`B19301_001`).}
#'   \item{gini}{Gini index of income inequality (`B19083_001`).}
#'   \item{poverty_total}{Population for whom poverty status is determined
#'     (`B17001_001`).}
#'   \item{poverty_below}{Population with income in the past 12 months below
#'     the poverty level (`B17001_002`).}
#'   \item{med_hhinc_moe, med_family_income_moe, per_capita_income_moe,
#'     gini_moe, poverty_total_moe, poverty_below_moe}{Margins of error for
#'     the corresponding estimates.}
#'   \item{poverty_rate}{`poverty_below / poverty_total`. `NA` when
#'     `poverty_total == 0`.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, tables B19013, B19113, B19301, B19083, B17001. Retrieved via
#'   [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_county_acs_income_df"
