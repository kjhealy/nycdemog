# Build nyc_county_acs_income_df: income, poverty, and inequality measures
# from the latest 5-year ACS, for the five NYC counties.
#
# Sources: ACS tables B19013 (median household income), B19113 (median
# family income), B19301 (per capita income), B19083 (Gini index), and
# B17001 (poverty status).

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_county_acs_income",
  get_nyc_acs(
    variables = acs_income_vars,
    geography = "county"
  )
)

nyc_county_acs_income_df <- raw |>
  select(
    geoid,
    county,
    name,
    all_of(names(acs_income_vars)),
    ends_with("_moe")
  ) |>
  mutate(
    poverty_rate = if_else(
      poverty_total > 0,
      poverty_below / poverty_total,
      NA_real_
    )
  )

attr(nyc_county_acs_income_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_county_acs_income_df, "acs_survey") <- attr(raw, "acs_survey")

usethis::use_data(nyc_county_acs_income_df, overwrite = TRUE, compress = "xz")
