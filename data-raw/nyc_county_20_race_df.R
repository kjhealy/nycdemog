# Build nyc_county_20_race_df: 2020 Decennial race x Hispanic origin counts
# for the five NYC counties.
#
# Source: 2020 Decennial Census, PL 94-171 redistricting summary file.

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_county_20_race",
  get_nyc_decennial(
    variables = pl20_race_hisp_vars,
    geography = "county",
    sumfile = "pl",
    summary_var = pl20_total_pop
  )
)

nyc_county_20_race_df <- raw |>
  rename(total_pop = summary_value) |>
  select(
    geoid,
    county,
    name,
    total_pop,
    all_of(names(pl20_race_hisp_vars))
  ) |>
  mutate(
    nh_white_prop = if_else(
      total_pop > 0,
      nh_white_alone / total_pop,
      NA_real_
    ),
    nh_black_prop = if_else(
      total_pop > 0,
      nh_black_alone / total_pop,
      NA_real_
    ),
    nh_asian_prop = if_else(
      total_pop > 0,
      nh_asian_alone / total_pop,
      NA_real_
    ),
    hispanic_prop = if_else(total_pop > 0, hispanic / total_pop, NA_real_),
    nh_two_or_more_prop = if_else(
      total_pop > 0,
      nh_two_or_more / total_pop,
      NA_real_
    )
  )

usethis::use_data(nyc_county_20_race_df, overwrite = TRUE, compress = "xz")
