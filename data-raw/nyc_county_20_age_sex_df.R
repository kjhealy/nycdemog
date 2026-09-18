# Build nyc_county_20_age_sex_df: 2020 Decennial sex by age for the five NYC
# counties.
#
# Source: 2020 Decennial Census, Demographic and Housing Characteristics
# (DHC) file, table P12 ("SEX BY AGE FOR SELECTED AGE CATEGORIES").

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

p12_codes <- sprintf("P12_%03dN", 1:49)
names(p12_codes) <- sprintf("p12_%03d", 1:49)

raw <- cache_call(
  "nyc_county_20_age_sex",
  get_nyc_decennial(
    variables = p12_codes,
    geography = "county",
    sumfile = "dhc"
  )
)

# Sum male + female counts within ten standard age bins.
nyc_county_20_age_sex_df <- raw |>
  transmute(
    geoid,
    county,
    name,
    total_pop = p12_001,
    male = p12_002,
    female = p12_026,
    age_under_5 = p12_003 + p12_027,
    age_5_17 = p12_004 + p12_005 + p12_006 + p12_028 + p12_029 + p12_030,
    age_18_24 = p12_007 +
      p12_008 +
      p12_009 +
      p12_010 +
      p12_031 +
      p12_032 +
      p12_033 +
      p12_034,
    age_25_34 = p12_011 + p12_012 + p12_035 + p12_036,
    age_35_44 = p12_013 + p12_014 + p12_037 + p12_038,
    age_45_54 = p12_015 + p12_016 + p12_039 + p12_040,
    age_55_64 = p12_017 + p12_018 + p12_019 + p12_041 + p12_042 + p12_043,
    age_65_74 = p12_020 + p12_021 + p12_022 + p12_044 + p12_045 + p12_046,
    age_75_84 = p12_023 + p12_024 + p12_047 + p12_048,
    age_85_plus = p12_025 + p12_049
  )

usethis::use_data(nyc_county_20_age_sex_df, overwrite = TRUE, compress = "xz")
