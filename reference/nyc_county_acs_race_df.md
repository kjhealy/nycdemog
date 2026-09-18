# New York City race and Hispanic origin by county, ACS 5-year

Race and Hispanic-origin estimates from the 2020-2024 American Community
Survey 5-year release for the five New York City counties (boroughs).
Sourced from ACS table B03002 ("Hispanic or Latino origin by race"),
with `B03002_001` as the population denominator. Each estimate is
accompanied by its 90% margin of error, with the suffix `_moe`. The
county-level counterpart of
[nyc_tract_acs_race_df](https://kjhealy.github.io/nycdemog/reference/nyc_tract_acs_race_df.md).
Joins to
[nycmaps::nyc_boros_sf](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
via the `county` column, which matches
`nycmaps::nyc_boros$short_county_name`.

## Usage

``` r
nyc_county_acs_race_df
```

## Format

A tibble with 5 rows and 25 columns:

- geoid:

  5-character county GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  County label as returned by the Census Bureau.

- total_pop:

  Total population (`B03002_001` summary estimate).

- total_pop_moe:

  Margin of error for `total_pop`.

- nh_white:

  Not Hispanic, White alone (`B03002_003`).

- nh_black:

  Not Hispanic, Black or African American alone (`B03002_004`).

- nh_aian:

  Not Hispanic, American Indian and Alaska Native alone (`B03002_005`).

- nh_asian:

  Not Hispanic, Asian alone (`B03002_006`).

- nh_hipi:

  Not Hispanic, Native Hawaiian and Other Pacific Islander alone
  (`B03002_007`).

- nh_other:

  Not Hispanic, some other race alone (`B03002_008`).

- nh_two_or_more:

  Not Hispanic, two or more races (`B03002_009`).

- hispanic:

  Hispanic or Latino, any race (`B03002_012`).

- nh_white_moe, nh_black_moe, nh_aian_moe, nh_asian_moe, nh_hipi_moe,
  nh_other_moe, nh_two_or_more_moe, hispanic_moe:

  Margins of error for the corresponding estimates.

- nh_white_prop:

  Proportion non-Hispanic White. `NA` when `total_pop == 0`.

- nh_black_prop:

  Proportion non-Hispanic Black.

- nh_asian_prop:

  Proportion non-Hispanic Asian.

- hispanic_prop:

  Proportion Hispanic or Latino.

## Source

US Census Bureau, 2020-2024 American Community Survey 5-year estimates,
table B03002. Retrieved via
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
<https://www.census.gov/programs-surveys/acs>
