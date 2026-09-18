# New York City labor force status by county, ACS 5-year

Labor force status estimates from the 2020-2024 American Community
Survey 5-year release for the five New York City counties (boroughs).
Sourced from ACS table B23025 ("Employment status for the population 16
years and over"). Each estimate is accompanied by its 90% margin of
error, with the suffix `_moe`. The county-level counterpart of
[nyc_tract_acs_employment_df](https://kjhealy.github.io/nycdemog/reference/nyc_tract_acs_employment_df.md).
Joins to
[nycmaps::nyc_boros_sf](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
via the `county` column, which matches
`nycmaps::nyc_boros$short_county_name`.

## Usage

``` r
nyc_county_acs_employment_df
```

## Format

A tibble with 5 rows and 19 columns:

- geoid:

  5-character county GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  County label as returned by the Census Bureau.

- lf_total:

  Population 16 years and over (`B23025_001`).

- lf_in_labor_force:

  In labor force (`B23025_002`).

- lf_civilian:

  Civilian labor force (`B23025_003`).

- lf_employed:

  Civilian employed (`B23025_004`).

- lf_unemployed:

  Civilian unemployed (`B23025_005`).

- lf_armed_forces:

  Armed forces (`B23025_006`).

- lf_not_in_labor_force:

  Not in labor force (`B23025_007`).

- lf_total_moe, lf_in_labor_force_moe, lf_civilian_moe, lf_employed_moe,
  lf_unemployed_moe, lf_armed_forces_moe, lf_not_in_labor_force_moe:

  Margins of error for the corresponding estimates.

- labor_force_participation:

  `lf_in_labor_force / lf_total`. `NA` when `lf_total == 0`.

- unemployment_rate:

  `lf_unemployed / lf_civilian`. `NA` when `lf_civilian == 0`.

## Source

US Census Bureau, 2020-2024 American Community Survey 5-year estimates,
table B23025. Retrieved via
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
<https://www.census.gov/programs-surveys/acs>
