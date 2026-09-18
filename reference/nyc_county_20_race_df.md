# New York City race and Hispanic origin by county, 2020

Population counts for the five New York City counties (boroughs), broken
down by race and Hispanic origin. Sourced from the 2020 Decennial Census
PL 94-171 redistricting summary file. The county-level counterpart of
[nyc_block_20_race_df](https://kjhealy.github.io/nycdemog/reference/nyc_block_20_race_df.md).
Joins to
[nycmaps::nyc_boros_sf](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
via the `county` column, which matches
`nycmaps::nyc_boros$short_county_name`.

## Usage

``` r
nyc_county_20_race_df
```

## Format

A tibble with 5 rows and 25 columns:

- geoid:

  5-character county GEOID (state + county).

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  County label as returned by the Census Bureau, e.g.
  `"Kings County, New York"`.

- total_pop:

  Total population of the county (PL summary variable `P1_001N`).

- white_alone:

  Population reporting White alone (`P1_003N`).

- black_alone:

  Population reporting Black or African American alone (`P1_004N`).

- aian_alone:

  American Indian and Alaska Native alone (`P1_005N`).

- asian_alone:

  Asian alone (`P1_006N`).

- hipi_alone:

  Native Hawaiian and Other Pacific Islander alone (`P1_007N`).

- other_alone:

  Some other race alone (`P1_008N`).

- two_or_more:

  Two or more races (`P1_009N`).

- hispanic:

  Hispanic or Latino population (`P2_002N`).

- non_hispanic:

  Not Hispanic or Latino population (`P2_003N`).

- nh_white_alone:

  Not Hispanic, White alone (`P2_005N`).

- nh_black_alone:

  Not Hispanic, Black or African American alone (`P2_006N`).

- nh_aian_alone:

  Not Hispanic, AIAN alone (`P2_007N`).

- nh_asian_alone:

  Not Hispanic, Asian alone (`P2_008N`).

- nh_hipi_alone:

  Not Hispanic, NHOPI alone (`P2_009N`).

- nh_other_alone:

  Not Hispanic, some other race alone (`P2_010N`).

- nh_two_or_more:

  Not Hispanic, two or more races (`P2_011N`).

- nh_white_prop:

  Proportion of `total_pop` that is non-Hispanic White alone. `NA` when
  `total_pop == 0`.

- nh_black_prop:

  Proportion non-Hispanic Black alone.

- nh_asian_prop:

  Proportion non-Hispanic Asian alone.

- hispanic_prop:

  Proportion Hispanic or Latino.

- nh_two_or_more_prop:

  Proportion non-Hispanic two or more races.

## Source

US Census Bureau, 2020 Decennial Census, PL 94-171 Redistricting Data
Summary File. Retrieved via
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html).
<https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html>
