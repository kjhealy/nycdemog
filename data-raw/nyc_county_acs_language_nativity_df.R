# Build nyc_county_acs_language_nativity_df: language spoken at home and
# nativity / citizenship from the latest 5-year ACS, for the five NYC
# counties.
#
# Sources: ACS table B16001 (language spoken at home, top categories) and
# B05002 (place of birth and citizenship).

source(here::here("data-raw", "_shared.R"))
source(here::here("data-raw", "_variables.R"))

raw <- cache_call(
  "nyc_county_acs_language_nativity",
  get_nyc_acs(
    variables = acs_language_nativity_vars,
    geography = "county"
  )
)

nyc_county_acs_language_nativity_df <- raw |>
  select(
    geoid,
    county,
    name,
    all_of(names(acs_language_nativity_vars)),
    ends_with("_moe")
  ) |>
  mutate(
    english_only_prop = if_else(
      lang_total > 0,
      lang_english_only / lang_total,
      NA_real_
    ),
    foreign_born_prop = if_else(
      nativity_total > 0,
      foreign_born / nativity_total,
      NA_real_
    )
  )

attr(nyc_county_acs_language_nativity_df, "acs_year") <- attr(raw, "acs_year")
attr(nyc_county_acs_language_nativity_df, "acs_survey") <- attr(
  raw,
  "acs_survey"
)

usethis::use_data(
  nyc_county_acs_language_nativity_df,
  overwrite = TRUE,
  compress = "xz"
)
