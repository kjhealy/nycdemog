# Build nyc_county_acs_race_df: race and Hispanic origin from the latest
# 5-year ACS, for the five NYC counties.
#
# Source: ACS table B03002.

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_county_acs_race",
  get_nyc_acs(
    variables = acs_race_vars,
    geography = "county",
    summary_var = acs_race_total
  )
)

nyc_county_acs_race_df <- raw |>
  rename(total_pop = summary_est, total_pop_moe = summary_moe) |>
  select(
    geoid,
    county,
    name,
    total_pop,
    total_pop_moe,
    matches(paste0(
      "^(",
      paste(names(acs_race_vars), collapse = "|"),
      ")(_moe)?$"
    ))
  ) |>
  mutate(
    nh_white_prop = if_else(total_pop > 0, nh_white / total_pop, NA_real_),
    nh_black_prop = if_else(total_pop > 0, nh_black / total_pop, NA_real_),
    nh_asian_prop = if_else(total_pop > 0, nh_asian / total_pop, NA_real_),
    hispanic_prop = if_else(total_pop > 0, hispanic / total_pop, NA_real_)
  )

attr(nyc_county_acs_race_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_county_acs_race_df, "acs_survey") <- attr(raw, "acs_survey")

usethis::use_data(nyc_county_acs_race_df, overwrite = TRUE, compress = "xz")
