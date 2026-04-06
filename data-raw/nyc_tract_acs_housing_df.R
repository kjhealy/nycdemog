# Build nyc_tract_acs_housing_df: housing units, occupancy, tenure, value,
# rent, and year built from the latest 5-year ACS, at the Census tract
# level for the five NYC counties.
#
# Sources: ACS tables B25001 (total units), B25002 (occupancy), B25003
# (tenure), B25077 (median value), B25064 (median gross rent), B25035
# (median year built).

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_tract_acs_housing",
  get_nyc_acs(
    variables = acs_housing_vars,
    geography = "tract"
  )
)

nyc_tract_acs_housing_df <- raw |>
  select(
    geoid,
    county,
    name,
    all_of(names(acs_housing_vars)),
    ends_with("_moe")
  ) |>
  mutate(
    owner_occupied_prop = if_else(
      tenure_total > 0,
      tenure_owner / tenure_total,
      NA_real_
    ),
    vacancy_rate = if_else(hu_total > 0, hu_vacant / hu_total, NA_real_)
  )

attr(nyc_tract_acs_housing_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_tract_acs_housing_df, "acs_survey") <- attr(raw, "acs_survey")

usethis::use_data(nyc_tract_acs_housing_df, overwrite = TRUE, compress = "xz")
