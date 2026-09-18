#' New York City educational attainment by county, ACS 5-year
#'
#' Educational attainment for the population 25 years and over from the
#' 2020-2024 American Community Survey 5-year release for the five New York
#' City counties (boroughs). Sourced from ACS table B15003. Each estimate is
#' accompanied by its 90% margin of error, with the suffix `_moe`. The
#' county-level counterpart of [nyc_tract_acs_education_df]. Joins to
#' [nycmaps::nyc_boros_sf] via the `county` column, which matches
#' `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 26 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{edu_total}{Population 25 years and over (`B15003_001`).}
#'   \item{edu_less_than_hs}{No schooling completed (`B15003_002`).}
#'   \item{edu_some_hs}{9th to 12th grade, no diploma (`B15003_016`).}
#'   \item{edu_hs}{Regular high school diploma (`B15003_017`).}
#'   \item{edu_some_college}{Some college, 1 or more years, no degree
#'     (`B15003_019`).}
#'   \item{edu_associates}{Associate's degree (`B15003_021`).}
#'   \item{edu_bachelors}{Bachelor's degree (`B15003_022`).}
#'   \item{edu_masters}{Master's degree (`B15003_023`).}
#'   \item{edu_professional}{Professional school degree (`B15003_024`).}
#'   \item{edu_doctorate}{Doctorate degree (`B15003_025`).}
#'   \item{edu_total_moe, edu_less_than_hs_moe, edu_some_hs_moe, edu_hs_moe,
#'     edu_some_college_moe, edu_associates_moe, edu_bachelors_moe,
#'     edu_masters_moe, edu_professional_moe, edu_doctorate_moe}{Margins of
#'     error for the corresponding estimates.}
#'   \item{bachelors_or_higher}{`edu_bachelors + edu_masters +
#'     edu_professional + edu_doctorate`.}
#'   \item{bachelors_or_higher_prop}{Proportion of `edu_total` with a
#'     bachelor's degree or higher. `NA` when `edu_total == 0`.}
#'   \item{less_than_hs_prop}{Proportion of `edu_total` whose highest
#'     attainment is below a high school diploma.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, table B15003. Retrieved via [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_county_acs_education_df"
