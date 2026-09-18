# New York City household type by Census tract, 2020

Household counts by type for the five New York City counties at the 2020
Census tract level. Sourced from the 2020 Decennial Census Demographic
and Housing Characteristics (DHC) file, table P16 ("Household type").
The family / non-family split sums exactly to `total_households`. Joins
to
[nycmaps::nyc_census_tracts_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_tracts_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_tract_20_household_df
```

## Format

A tibble with 2,327 rows and 14 columns:

- geoid:

  11-character tract GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census tract label as returned by the Census Bureau.

- total_households:

  Total occupied housing units (`P16_001N`).

- family_households:

  Family households (`P16_002N`).

- married_couple:

  Married-couple family households (`P16_003N`).

- other_family:

  Other family households (`P16_004N`).

- male_householder_no_spouse:

  Male householder, no spouse present (`P16_005N`).

- female_householder_no_spouse:

  Female householder, no spouse present (`P16_006N`).

- nonfamily_households:

  Non-family households (`P16_007N`).

- living_alone:

  Householder living alone (`P16_008N`).

- not_living_alone:

  Non-family householder not living alone (`P16_009N`).

- family_prop:

  Proportion of households that are family households. `NA` when
  `total_households == 0`.

- living_alone_prop:

  Proportion of households whose householder is living alone.

## Source

US Census Bureau, 2020 Decennial Census, Demographic and Housing
Characteristics (DHC) File, table P16. Retrieved via
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html).
<https://www.census.gov/data/tables/2023/dec/2020-census-dhc.html>
