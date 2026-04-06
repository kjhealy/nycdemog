#' New York City labor force status by Census tract, ACS 5-year
#'
#' Labor force status estimates from the 2020-2024 American Community Survey
#' 5-year release for the five New York City counties at the Census tract
#' level. Sourced from ACS table B23025 ("Employment status for the
#' population 16 years and over"). Each estimate is accompanied by its 90%
#' margin of error, with the suffix `_moe`. Joins to
#' [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 19 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
#'   \item{lf_total}{Population 16 years and over (`B23025_001`).}
#'   \item{lf_in_labor_force}{In labor force (`B23025_002`).}
#'   \item{lf_civilian}{Civilian labor force (`B23025_003`).}
#'   \item{lf_employed}{Civilian employed (`B23025_004`).}
#'   \item{lf_unemployed}{Civilian unemployed (`B23025_005`).}
#'   \item{lf_armed_forces}{Armed forces (`B23025_006`).}
#'   \item{lf_not_in_labor_force}{Not in labor force (`B23025_007`).}
#'   \item{lf_total_moe, lf_in_labor_force_moe, lf_civilian_moe,
#'     lf_employed_moe, lf_unemployed_moe, lf_armed_forces_moe,
#'     lf_not_in_labor_force_moe}{Margins of error for the corresponding
#'     estimates.}
#'   \item{labor_force_participation}{`lf_in_labor_force / lf_total`. `NA`
#'     when `lf_total == 0`.}
#'   \item{unemployment_rate}{`lf_unemployed / lf_civilian`. `NA` when
#'     `lf_civilian == 0`.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, table B23025. Retrieved via [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_tract_acs_employment_df"
