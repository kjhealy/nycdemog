# Census variable code lists for the nycdemog stored datasets.
#
# Each block below names the variables we ship for one topic. Codes are
# referenced by name in the corresponding `data-raw/<dataset>.R` script.
#
# To explore additional variables interactively, use:
#
#   load_nyc_variables(2024, "acs5")     # latest 5-year ACS
#   load_nyc_variables(2020, "pl")       # 2020 redistricting file
#   load_nyc_variables(2020, "dhc")      # 2020 Demographic and Housing Characteristics

# -----------------------------------------------------------------------------
# Decennial 2020 - PL 94-171 (block level)
# Source: example.R in data-to-be-packaged/demog
# -----------------------------------------------------------------------------

pl20_total_pop <- c(total_pop = "P1_001N")

pl20_race_hisp_vars <- c(
  white_alone = "P1_003N",
  black_alone = "P1_004N",
  aian_alone = "P1_005N",
  asian_alone = "P1_006N",
  hipi_alone = "P1_007N",
  other_alone = "P1_008N",
  two_or_more = "P1_009N",
  hispanic = "P2_002N",
  non_hispanic = "P2_003N",
  nh_white_alone = "P2_005N",
  nh_black_alone = "P2_006N",
  nh_aian_alone = "P2_007N",
  nh_asian_alone = "P2_008N",
  nh_hipi_alone = "P2_009N",
  nh_other_alone = "P2_010N",
  nh_two_or_more = "P2_011N"
)

# Adults vs. children, also from PL 94-171.
pl20_adults_vars <- c(adults = "P3_001N")


# -----------------------------------------------------------------------------
# Decennial 2020 - DHC (tract level)
# -----------------------------------------------------------------------------
#
# The exact variable IDs in the Demographic and Housing Characteristics file
# are long; we resolve them dynamically in the data-raw scripts using
# load_nyc_variables(2020, "dhc"), filtered by `concept`. The concepts we
# care about are:
#
#   * "SEX BY AGE" (table P12) - tract-level age x sex distribution
#   * "HOUSEHOLD TYPE" (table H9 / P18) - family vs. non-family households
#
# The data-raw scripts that consume these (`nyc_tract_20_age_sex_df.R`,
# `nyc_tract_20_household_df.R`) build the variable vector at the top of the
# script after a one-time `load_nyc_variables()` lookup, so we always pick up
# the canonical IDs straight from the Census catalogue rather than guessing.

# -----------------------------------------------------------------------------
# ACS 5-year (tract level)
#
# All ACS variable codes refer to detailed tables in the latest 5-year
# release. The accompanying `data-raw/<topic>.R` script applies the variable
# list with get_nyc_acs() and reshapes / labels the result.
# -----------------------------------------------------------------------------

# Race and Hispanic origin (table B03002)
acs_race_total <- c(total_pop = "B03002_001")
acs_race_vars <- c(
  nh_white = "B03002_003",
  nh_black = "B03002_004",
  nh_aian = "B03002_005",
  nh_asian = "B03002_006",
  nh_hipi = "B03002_007",
  nh_other = "B03002_008",
  nh_two_or_more = "B03002_009",
  hispanic = "B03002_012"
)

# Income and poverty
acs_income_vars <- c(
  med_hhinc = "B19013_001",
  med_family_income = "B19113_001",
  per_capita_income = "B19301_001",
  gini = "B19083_001",
  poverty_total = "B17001_001",
  poverty_below = "B17001_002"
)

# Educational attainment for the population 25 years and over (table B15003)
acs_education_vars <- c(
  edu_total = "B15003_001",
  edu_less_than_hs = "B15003_002",
  edu_some_hs = "B15003_016",
  edu_hs = "B15003_017",
  edu_some_college = "B15003_019",
  edu_associates = "B15003_021",
  edu_bachelors = "B15003_022",
  edu_masters = "B15003_023",
  edu_professional = "B15003_024",
  edu_doctorate = "B15003_025"
)

# Labor force status (table B23025) and aggregate occupation/industry counts
acs_employment_vars <- c(
  lf_total = "B23025_001",
  lf_in_labor_force = "B23025_002",
  lf_civilian = "B23025_003",
  lf_employed = "B23025_004",
  lf_unemployed = "B23025_005",
  lf_armed_forces = "B23025_006",
  lf_not_in_labor_force = "B23025_007"
)

# Housing tenure, value, rent, year built (selected B25 tables)
acs_housing_vars <- c(
  hu_total = "B25001_001",
  hu_occupied = "B25002_002",
  hu_vacant = "B25002_003",
  tenure_total = "B25003_001",
  tenure_owner = "B25003_002",
  tenure_renter = "B25003_003",
  median_value = "B25077_001",
  median_gross_rent = "B25064_001",
  median_year_built = "B25035_001"
)

# Language spoken at home (table B16001 totals) and nativity (B05002)
acs_language_nativity_vars <- c(
  lang_total = "B16001_001",
  lang_english_only = "B16001_002",
  lang_spanish = "B16001_003",
  nativity_total = "B05002_001",
  native = "B05002_002",
  foreign_born = "B05002_013",
  naturalized = "B05002_014",
  not_citizen = "B05002_021"
)
