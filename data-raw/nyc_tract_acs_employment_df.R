# Build nyc_tract_acs_employment_df: labor force status from the latest
# 5-year ACS, at the Census tract level for the five NYC counties.
#
# Source: ACS table B23025.

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_tract_acs_employment",
  get_nyc_acs(
    variables = acs_employment_vars,
    geography = "tract"
  )
)

nyc_tract_acs_employment_df <- raw |>
  select(
    geoid,
    county,
    name,
    all_of(names(acs_employment_vars)),
    ends_with("_moe")
  ) |>
  mutate(
    labor_force_participation = if_else(
      lf_total > 0,
      lf_in_labor_force / lf_total,
      NA_real_
    ),
    unemployment_rate = if_else(
      lf_civilian > 0,
      lf_unemployed / lf_civilian,
      NA_real_
    )
  )

attr(nyc_tract_acs_employment_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_tract_acs_employment_df, "acs_survey") <- attr(raw, "acs_survey")

usethis::use_data(
  nyc_tract_acs_employment_df,
  overwrite = TRUE,
  compress = "xz"
)
