#' New York City adults and children by Census block, 2020
#'
#' Population aged 18 and over (and the derived population under 18) for the
#' five New York City counties at the 2020 Census block level. Sourced from
#' the 2020 Decennial Census PL 94-171 redistricting summary file. Joins to
#' [nycmaps::nyc_census_blocks_2020_sf] on `geoid`.
#'
#' @format A tibble with 37,984 rows and 6 columns:
#' \describe{
#'   \item{geoid}{15-character block GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census block label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population of the block (`P1_001N`).}
#'   \item{adults}{Population aged 18 and over (`P3_001N`).}
#'   \item{children}{Population under 18, computed as `total_pop - adults`.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, PL 94-171 Redistricting
#'   Data Summary File. Retrieved via [tidycensus::get_decennial()].
#'   <https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html>
#' @keywords datasets
"nyc_block_20_adults_df"
