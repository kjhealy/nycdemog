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


#' New York City race and Hispanic origin by Census block, 2020
#'
#' Population counts for the five New York City counties at the 2020 Census
#' block level, broken down by race and Hispanic origin. Sourced from the
#' 2020 Decennial Census PL 94-171 redistricting summary file. Joins to
#' [nycmaps::nyc_census_blocks_2020_sf] on `geoid`.
#'
#' @format A tibble with 37,984 rows and 25 columns:
#' \describe{
#'   \item{geoid}{15-character block GEOID (state + county + tract + block).}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census block label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population of the block (PL summary variable
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
"nyc_block_20_race_df"


#' New York City adults and children by county, 2020
#'
#' Population aged 18 and over (and the derived population under 18) for the
#' five New York City counties (boroughs). Sourced from the 2020 Decennial
#' Census PL 94-171 redistricting summary file. The county-level counterpart
#' of [nyc_block_20_adults_df]. Joins to [nycmaps::nyc_boros_sf] via the
#' `county` column, which matches `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 6 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population of the county (`P1_001N`).}
#'   \item{adults}{Population aged 18 and over (`P3_001N`).}
#'   \item{children}{Population under 18, computed as `total_pop - adults`.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, PL 94-171 Redistricting
#'   Data Summary File. Retrieved via [tidycensus::get_decennial()].
#'   <https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html>
#' @keywords datasets
"nyc_county_20_adults_df"


#' New York City sex and age by county, 2020
#'
#' Total population, sex, and ten standard age bins for the five New York
#' City counties (boroughs). Sourced from the 2020 Decennial Census
#' Demographic and Housing Characteristics (DHC) file, table P12 ("Sex by
#' age for selected age categories"). Each age bin is the sum of the
#' corresponding male and female detail categories from P12, so the bins sum
#' exactly to `total_pop` and `male + female` equals `total_pop`. The
#' county-level counterpart of [nyc_tract_20_age_sex_df]. Joins to
#' [nycmaps::nyc_boros_sf] via the `county` column, which matches
#' `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 16 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID (state + county).}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population (`P12_001N`).}
#'   \item{male}{Male population (`P12_002N`).}
#'   \item{female}{Female population (`P12_026N`).}
#'   \item{age_under_5}{Population aged under 5.}
#'   \item{age_5_17}{Population aged 5 to 17.}
#'   \item{age_18_24}{Population aged 18 to 24.}
#'   \item{age_25_34}{Population aged 25 to 34.}
#'   \item{age_35_44}{Population aged 35 to 44.}
#'   \item{age_45_54}{Population aged 45 to 54.}
#'   \item{age_55_64}{Population aged 55 to 64.}
#'   \item{age_65_74}{Population aged 65 to 74.}
#'   \item{age_75_84}{Population aged 75 to 84.}
#'   \item{age_85_plus}{Population aged 85 and over.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, Demographic and Housing
#'   Characteristics (DHC) File, table P12. Retrieved via
#'   [tidycensus::get_decennial()].
#'   <https://www.census.gov/data/tables/2023/dec/2020-census-dhc.html>
#' @keywords datasets
"nyc_county_20_age_sex_df"


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


#' New York City labor force status by county, ACS 5-year
#'
#' Labor force status estimates from the 2020-2024 American Community Survey
#' 5-year release for the five New York City counties (boroughs). Sourced
#' from ACS table B23025 ("Employment status for the population 16 years and
#' over"). Each estimate is accompanied by its 90% margin of error, with the
#' suffix `_moe`. The county-level counterpart of
#' [nyc_tract_acs_employment_df]. Joins to [nycmaps::nyc_boros_sf] via the
#' `county` column, which matches `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 19 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
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
"nyc_county_acs_employment_df"


#' New York City housing units, tenure, and value by county, ACS 5-year
#'
#' Housing-unit counts, occupancy, tenure, value, rent, and year built from
#' the 2020-2024 American Community Survey 5-year release for the five New
#' York City counties (boroughs). Each estimate is accompanied by its 90%
#' margin of error, with the suffix `_moe`. The county-level counterpart of
#' [nyc_tract_acs_housing_df]. Joins to [nycmaps::nyc_boros_sf] via the
#' `county` column, which matches `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 23 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
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
"nyc_county_acs_housing_df"


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


#' New York City race and Hispanic origin by county, ACS 5-year
#'
#' Race and Hispanic-origin estimates from the 2020-2024 American Community
#' Survey 5-year release for the five New York City counties (boroughs).
#' Sourced from ACS table B03002 ("Hispanic or Latino origin by race"), with
#' `B03002_001` as the population denominator. Each estimate is accompanied
#' by its 90% margin of error, with the suffix `_moe`. The county-level
#' counterpart of [nyc_tract_acs_race_df]. Joins to [nycmaps::nyc_boros_sf]
#' via the `county` column, which matches
#' `nycmaps::nyc_boros$short_county_name`.
#'
#' @format A tibble with 5 rows and 25 columns:
#' \describe{
#'   \item{geoid}{5-character county GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{County label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population (`B03002_001` summary estimate).}
#'   \item{total_pop_moe}{Margin of error for `total_pop`.}
#'   \item{nh_white}{Not Hispanic, White alone (`B03002_003`).}
#'   \item{nh_black}{Not Hispanic, Black or African American alone
#'     (`B03002_004`).}
#'   \item{nh_aian}{Not Hispanic, American Indian and Alaska Native alone
#'     (`B03002_005`).}
#'   \item{nh_asian}{Not Hispanic, Asian alone (`B03002_006`).}
#'   \item{nh_hipi}{Not Hispanic, Native Hawaiian and Other Pacific Islander
#'     alone (`B03002_007`).}
#'   \item{nh_other}{Not Hispanic, some other race alone (`B03002_008`).}
#'   \item{nh_two_or_more}{Not Hispanic, two or more races (`B03002_009`).}
#'   \item{hispanic}{Hispanic or Latino, any race (`B03002_012`).}
#'   \item{nh_white_moe, nh_black_moe, nh_aian_moe, nh_asian_moe, nh_hipi_moe,
#'     nh_other_moe, nh_two_or_more_moe, hispanic_moe}{Margins of error for
#'     the corresponding estimates.}
#'   \item{nh_white_prop}{Proportion non-Hispanic White. `NA` when
#'     `total_pop == 0`.}
#'   \item{nh_black_prop}{Proportion non-Hispanic Black.}
#'   \item{nh_asian_prop}{Proportion non-Hispanic Asian.}
#'   \item{hispanic_prop}{Proportion Hispanic or Latino.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, table B03002. Retrieved via [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_county_acs_race_df"


#' New York City sex and age by Census tract, 2020
#'
#' Total population, sex, and ten standard age bins for the five New York
#' City counties at the 2020 Census tract level. Sourced from the 2020
#' Decennial Census Demographic and Housing Characteristics (DHC) file,
#' table P12 ("Sex by age for selected age categories"). Each age bin is the
#' sum of the corresponding male and female detail categories from P12, so
#' the bins sum exactly to `total_pop` and `male + female` equals
#' `total_pop`. Joins to [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 16 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID (state + county + tract).}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population (`P12_001N`).}
#'   \item{male}{Male population (`P12_002N`).}
#'   \item{female}{Female population (`P12_026N`).}
#'   \item{age_under_5}{Population aged under 5.}
#'   \item{age_5_17}{Population aged 5 to 17.}
#'   \item{age_18_24}{Population aged 18 to 24.}
#'   \item{age_25_34}{Population aged 25 to 34.}
#'   \item{age_35_44}{Population aged 35 to 44.}
#'   \item{age_45_54}{Population aged 45 to 54.}
#'   \item{age_55_64}{Population aged 55 to 64.}
#'   \item{age_65_74}{Population aged 65 to 74.}
#'   \item{age_75_84}{Population aged 75 to 84.}
#'   \item{age_85_plus}{Population aged 85 and over.}
#' }
#'
#' @source US Census Bureau, 2020 Decennial Census, Demographic and Housing
#'   Characteristics (DHC) File, table P12. Retrieved via
#'   [tidycensus::get_decennial()].
#'   <https://www.census.gov/data/tables/2023/dec/2020-census-dhc.html>
#' @keywords datasets
"nyc_tract_20_age_sex_df"


#' New York City household type by Census tract, 2020
#'
#' Household counts by type for the five New York City counties at the 2020
#' Census tract level. Sourced from the 2020 Decennial Census Demographic
#' and Housing Characteristics (DHC) file, table P16 ("Household type"). The
#' family / non-family split sums exactly to `total_households`. Joins to
#' [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 14 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
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
"nyc_tract_20_household_df"


#' New York City educational attainment by Census tract, ACS 5-year
#'
#' Educational attainment for the population 25 years and over from the
#' 2020-2024 American Community Survey 5-year release for the five New York
#' City counties at the Census tract level. Sourced from ACS table B15003.
#' Each estimate is accompanied by its 90% margin of error, with the suffix
#' `_moe`. Joins to [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 26 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
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
"nyc_tract_acs_education_df"


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


#' New York City income, poverty, and inequality by Census tract, ACS 5-year
#'
#' Income, poverty, and inequality estimates from the 2020-2024 American
#' Community Survey 5-year release for the five New York City counties at
#' the Census tract level. Each estimate is accompanied by its 90% margin of
#' error, with the suffix `_moe`. Joins to
#' [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 16 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
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
"nyc_tract_acs_income_df"


#' New York City language and nativity by Census tract, ACS 5-year
#'
#' Language spoken at home and place of birth / citizenship from the
#' 2020-2024 American Community Survey 5-year release for the five New York
#' City counties at the Census tract level. Sourced from ACS tables B16001
#' (language spoken at home) and B05002 (place of birth and citizenship).
#' Each estimate is accompanied by its 90% margin of error, with the suffix
#' `_moe`. Joins to [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 21 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
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
"nyc_tract_acs_language_nativity_df"


#' New York City race and Hispanic origin by Census tract, ACS 5-year
#'
#' Race and Hispanic-origin estimates from the 2020-2024 American Community
#' Survey 5-year release for the five New York City counties at the Census
#' tract level. Sourced from ACS table B03002 ("Hispanic or Latino origin by
#' race"), with `B03002_001` as the population denominator. Each estimate is
#' accompanied by its 90% margin of error, with the suffix `_moe`. Joins to
#' [nycmaps::nyc_census_tracts_2020_sf] on `geoid`.
#'
#' @format A tibble with 2,327 rows and 25 columns:
#' \describe{
#'   \item{geoid}{11-character tract GEOID.}
#'   \item{county}{NYC county (borough) name derived from `geoid`.}
#'   \item{name}{Census tract label as returned by the Census Bureau.}
#'   \item{total_pop}{Total population (`B03002_001` summary estimate).}
#'   \item{total_pop_moe}{Margin of error for `total_pop`.}
#'   \item{nh_white}{Not Hispanic, White alone (`B03002_003`).}
#'   \item{nh_black}{Not Hispanic, Black or African American alone
#'     (`B03002_004`).}
#'   \item{nh_aian}{Not Hispanic, American Indian and Alaska Native alone
#'     (`B03002_005`).}
#'   \item{nh_asian}{Not Hispanic, Asian alone (`B03002_006`).}
#'   \item{nh_hipi}{Not Hispanic, Native Hawaiian and Other Pacific Islander
#'     alone (`B03002_007`).}
#'   \item{nh_other}{Not Hispanic, some other race alone (`B03002_008`).}
#'   \item{nh_two_or_more}{Not Hispanic, two or more races (`B03002_009`).}
#'   \item{hispanic}{Hispanic or Latino, any race (`B03002_012`).}
#'   \item{nh_white_moe, nh_black_moe, nh_aian_moe, nh_asian_moe, nh_hipi_moe,
#'     nh_other_moe, nh_two_or_more_moe, hispanic_moe}{Margins of error for
#'     the corresponding estimates.}
#'   \item{nh_white_prop}{Proportion non-Hispanic White. `NA` when
#'     `total_pop == 0`.}
#'   \item{nh_black_prop}{Proportion non-Hispanic Black.}
#'   \item{nh_asian_prop}{Proportion non-Hispanic Asian.}
#'   \item{hispanic_prop}{Proportion Hispanic or Latino.}
#' }
#'
#' @source US Census Bureau, 2020-2024 American Community Survey 5-year
#'   estimates, table B03002. Retrieved via [tidycensus::get_acs()].
#'   <https://www.census.gov/programs-surveys/acs>
#' @keywords datasets
"nyc_tract_acs_race_df"
