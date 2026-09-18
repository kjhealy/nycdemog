# New York City language and nativity by Census tract, ACS 5-year

Language spoken at home and place of birth / citizenship from the
2020-2024 American Community Survey 5-year release for the five New York
City counties at the Census tract level. Sourced from ACS tables B16001
(language spoken at home) and B05002 (place of birth and citizenship).
Each estimate is accompanied by its 90% margin of error, with the suffix
`_moe`. Joins to
[nycmaps::nyc_census_tracts_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_tracts_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_tract_acs_language_nativity_df
```

## Format

A tibble with 2,327 rows and 21 columns:

- geoid:

  11-character tract GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census tract label as returned by the Census Bureau.

- lang_total:

  Population 5 years and over (`B16001_001`).

- lang_english_only:

  Speaks English only at home (`B16001_002`).

- lang_spanish:

  Speaks Spanish at home (`B16001_003`).

- nativity_total:

  Total population, nativity universe (`B05002_001`).

- native:

  Native-born population (`B05002_002`).

- foreign_born:

  Foreign-born population (`B05002_013`).

- naturalized:

  Foreign-born, naturalized US citizen (`B05002_014`).

- not_citizen:

  Foreign-born, not a US citizen (`B05002_021`).

- lang_total_moe, lang_english_only_moe, lang_spanish_moe,
  nativity_total_moe, native_moe, foreign_born_moe, naturalized_moe,
  not_citizen_moe:

  Margins of error for the corresponding estimates.

- english_only_prop:

  `lang_english_only / lang_total`. `NA` when `lang_total == 0`.

- foreign_born_prop:

  `foreign_born / nativity_total`. `NA` when `nativity_total == 0`.

## Source

US Census Bureau, 2020-2024 American Community Survey 5-year estimates,
tables B16001 and B05002. Retrieved via
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
<https://www.census.gov/programs-surveys/acs>
