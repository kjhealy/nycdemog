# Build nyc_tract_20_household_df: 2020 Decennial household type at the
# Census tract level for the five NYC counties.
#
# Source: 2020 Decennial Census, Demographic and Housing Characteristics
# (DHC) file, table P16 ("HOUSEHOLD TYPE").

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

p16_vars <- c(
  total_households = "P16_001N",
  family_households = "P16_002N",
  married_couple = "P16_003N",
  other_family = "P16_004N",
  male_householder_no_spouse = "P16_005N",
  female_householder_no_spouse = "P16_006N",
  nonfamily_households = "P16_007N",
  living_alone = "P16_008N",
  not_living_alone = "P16_009N"
)

raw <- cache_call(
  "nyc_tract_20_household",
  get_nyc_decennial(
    variables = p16_vars,
    geography = "tract",
    sumfile = "dhc"
  )
)

nyc_tract_20_household_df <- raw |>
  select(geoid, county, name, all_of(names(p16_vars))) |>
  mutate(
    family_prop = if_else(
      total_households > 0,
      family_households / total_households,
      NA_real_
    ),
    living_alone_prop = if_else(
      total_households > 0,
      living_alone / total_households,
      NA_real_
    )
  )

usethis::use_data(nyc_tract_20_household_df, overwrite = TRUE, compress = "xz")
