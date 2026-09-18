# New York City adults and children by county, 2020

Population aged 18 and over (and the derived population under 18) for
the five New York City counties (boroughs). Sourced from the 2020
Decennial Census PL 94-171 redistricting summary file. The county-level
counterpart of
[nyc_block_20_adults_df](https://kjhealy.github.io/nycdemog/reference/nyc_block_20_adults_df.md).
Joins to
[nycmaps::nyc_boros_sf](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
via the `county` column, which matches
`nycmaps::nyc_boros$short_county_name`.

## Usage

``` r
nyc_county_20_adults_df
```

## Format

A tibble with 5 rows and 6 columns:

- geoid:

  5-character county GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  County label as returned by the Census Bureau.

- total_pop:

  Total population of the county (`P1_001N`).

- adults:

  Population aged 18 and over (`P3_001N`).

- children:

  Population under 18, computed as `total_pop - adults`.

## Source

US Census Bureau, 2020 Decennial Census, PL 94-171 Redistricting Data
Summary File. Retrieved via
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html).
<https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html>
