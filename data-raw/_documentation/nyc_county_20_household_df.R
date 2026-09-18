#' New York City household type by county, 2020
#'
#' Household counts by type for the five New York City counties (boroughs).
#' Sourced from the 2020 Decennial Census Demographic and Housing
#' Characteristics (DHC) file, table P16 ("Household type"). The family /
#' non-family split sums exactly to `total_households`. The county-level
#' counterpart of [nyc_tract_20_household_df]. Joins to
#' [nycmaps::nyc_boros_sf] via the `county` column, which matches
#' `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 14 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{total_households}{Total occupied housing units (`P16_001N`).}
#'   \item{family_households}{Family households (`P16_002N`).}
#'   \item{married_couple}{Married-couple family households (`P16_003N`).}
#'   \item{other_family}{Other family households (`P16_004N`).}
#'   \item{male_householder_no_spouse}{Male householder, no spouse present
#'     (`P16_005N`).}
#'   \item{female_householder_no_spouse}{Female householder, no spouse
#'     present (`P16_006N`).}
#'   \item{nonfamily_households}{Non-family households (`P16_007N`).}
#'   \item{living_alone}{Householder living alone (`P16_008N`).}
#'   \item{not_living_alone}{Non-family householder not living alone
#'     (`P16_009N`).}
#'   \item{family_prop}{Proportion of households that are family households.
#'     `NA` when `total_households == 0`.}
#'   \item{living_alone_prop}{Proportion of households whose householder is
#'     living alone.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, Demographic and Housing
#'   Characteristics (DHC) File, table P16. Retrieved via
#'   [tidycensus::get_decennial()].
#'   <https://www.census.gov/data/tables/2023/dec/2020-census-dhc.html>
#' @keywords datasets
"nyc_county_20_household_df"
