# Build nyc_block_20_adults_df: 2020 Decennial population aged 18+ at the
# Census block level for the five NYC counties, with derived child count.
#
# Source: 2020 Decennial Census, PL 94-171 redistricting summary file.

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_block_20_adults",
  get_nyc_decennial(
    variables = pl20_adults_vars,
    geography = "block",
    sumfile = "pl",
    summary_var = pl20_total_pop
  )
)

nyc_block_20_adults_df <- raw |>
  rename(total_pop = summary_value) |>
  mutate(children = total_pop - adults) |>
  select(geoid, county, name, total_pop, adults, children)

usethis::use_data(nyc_block_20_adults_df, overwrite = TRUE, compress = "xz")
