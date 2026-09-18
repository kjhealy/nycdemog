# New York City race and Hispanic origin by Census block, 2020

Population counts for the five New York City counties at the 2020 Census
block level, broken down by race and Hispanic origin. Sourced from the
2020 Decennial Census PL 94-171 redistricting summary file. Joins to
[nycmaps::nyc_census_blocks_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_blocks_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_block_20_race_df
```

## Format

A tibble with 37,984 rows and 25 columns:

- geoid:

  15-character block GEOID (state + county + tract + block).

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census block label as returned by the Census Bureau.

- total_pop:

  Total population of the block (PL summary variable `P1_001N`).

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
