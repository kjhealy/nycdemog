#' New York City language and nativity by county, ACS 5-year
#'
#' Language spoken at home and place of birth / citizenship from the
#' 2020-2024 American Community Survey 5-year release for the five New York
#' City counties (boroughs). Sourced from ACS tables B16001 (language spoken
#' at home) and B05002 (place of birth and citizenship). Each estimate is
#' accompanied by its 90% margin of error, with the suffix `_moe`. The
#' county-level counterpart of [nyc_tract_acs_language_nativity_df]. Joins
#' to [nycmaps::nyc_boros_sf] via the `county` column, which matches
#' `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 21 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{lang_total}{Population 5 years and over (`B16001_001`).}
#'   \item{lang_english_only}{Speaks English only at home (`B16001_002`).}
#'   \item{lang_spanish}{Speaks Spanish at home (`B16001_003`).}
#'   \item{nativity_total}{Total population, nativity universe (`B05002_001`).}
#'   \item{native}{Native-born population (`B05002_002`).}
#'   \item{foreign_born}{Foreign-born population (`B05002_013`).}
#'   \item{naturalized}{Foreign-born, naturalized US citizen (`B05002_014`).}
#'   \item{not_citizen}{Foreign-born, not a US citizen (`B05002_021`).}
#'   \item{lang_total_moe, lang_english_only_moe, lang_spanish_moe,
#'     nativity_total_moe, native_moe, foreign_born_moe, naturalized_moe,
#'     not_citizen_moe}{Margins of error for the corresponding estimates.}
#'   \item{english_only_prop}{`lang_english_only / lang_total`. `NA` when
#'     `lang_total == 0`.}
#'   \item{foreign_born_prop}{`foreign_born / nativity_total`. `NA` when
#'     `nativity_total == 0`.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, tables B16001 and B05002. Retrieved via
#'   [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_county_acs_language_nativity_df"
