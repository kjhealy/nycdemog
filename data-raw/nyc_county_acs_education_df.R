# Build nyc_county_acs_education_df: educational attainment for the
# population 25 years and over from the latest 5-year ACS, for the five NYC
# counties.
#
# Source: ACS table B15003.

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_county_acs_education",
  get_nyc_acs(
    variables = acs_education_vars,
    geography = "county"
  )
)

nyc_county_acs_education_df <- raw |>
  select(
    geoid,
    county,
    name,
    all_of(names(acs_education_vars)),
    ends_with("_moe")
  ) |>
  mutate(
    bachelors_or_higher = edu_bachelors +
      edu_masters +
      edu_professional +
      edu_doctorate,
    bachelors_or_higher_prop = if_else(
      edu_total > 0,
      bachelors_or_higher / edu_total,
      NA_real_
    ),
    less_than_hs_prop = if_else(
      edu_total > 0,
      (edu_less_than_hs + edu_some_hs) / edu_total,
      NA_real_
    )
  )

attr(nyc_county_acs_education_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_county_acs_education_df, "acs_survey") <- attr(raw, "acs_survey")

usethis::use_data(
  nyc_county_acs_education_df,
  overwrite = TRUE,
  compress = "xz"
)
