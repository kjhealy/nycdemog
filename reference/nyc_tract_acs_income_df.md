# New York City income, poverty, and inequality by Census tract, ACS 5-year

Income, poverty, and inequality estimates from the 2020-2024 American
Community Survey 5-year release for the five New York City counties at
the Census tract level. Each estimate is accompanied by its 90% margin
of error, with the suffix `_moe`. Joins to
[nycmaps::nyc_census_tracts_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_tracts_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_tract_acs_income_df
```

## Format

A tibble with 2,327 rows and 16 columns:

- geoid:

  11-character tract GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census tract label as returned by the Census Bureau.

- med_hhinc:

  Median household income, inflation-adjusted dollars (`B19013_001`).

- med_family_income:

  Median family income (`B19113_001`).

- per_capita_income:

  Per capita income (`B19301_001`).

- gini:

  Gini index of income inequality (`B19083_001`).

- poverty_total:

  Population for whom poverty status is determined (`B17001_001`).

- poverty_below:

  Population with income in the past 12 months below the poverty level
  (`B17001_002`).

- med_hhinc_moe, med_family_income_moe, per_capita_income_moe, gini_moe,
  poverty_total_moe, poverty_below_moe:

  Margins of error for the corresponding estimates.

- poverty_rate:

  `poverty_below / poverty_total`. `NA` when `poverty_total == 0`.

## Source

US Census Bureau, 2020-2024 American Community Survey 5-year estimates,
tables B19013, B19113, B19301, B19083, B17001. Retrieved via
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
<https://www.census.gov/programs-surveys/acs>
