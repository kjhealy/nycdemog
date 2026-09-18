# New York City sex and age by county, 2020

Total population, sex, and ten standard age bins for the five New York
City counties (boroughs). Sourced from the 2020 Decennial Census
Demographic and Housing Characteristics (DHC) file, table P12 ("Sex by
age for selected age categories"). Each age bin is the sum of the
corresponding male and female detail categories from P12, so the bins
sum exactly to `total_pop` and `male + female` equals `total_pop`. The
county-level counterpart of
[nyc_tract_20_age_sex_df](https://kjhealy.github.io/nycdemog/reference/nyc_tract_20_age_sex_df.md).
Joins to
[nycmaps::nyc_boros_sf](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
via the `county` column, which matches
`nycmaps::nyc_boros$short_county_name`.

## Usage

``` r
nyc_county_20_age_sex_df
```

## Format

A tibble with 5 rows and 16 columns:

- geoid:

  5-character county GEOID (state + county).

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  County label as returned by the Census Bureau.

- total_pop:

  Total population (`P12_001N`).

- male:

  Male population (`P12_002N`).

- female:

  Female population (`P12_026N`).

- age_under_5:

  Population aged under 5.

- age_5_17:

  Population aged 5 to 17.

- age_18_24:

  Population aged 18 to 24.

- age_25_34:

  Population aged 25 to 34.

- age_35_44:

  Population aged 35 to 44.

- age_45_54:

  Population aged 45 to 54.

- age_55_64:

  Population aged 55 to 64.

- age_65_74:

  Population aged 65 to 74.

- age_75_84:

  Population aged 75 to 84.

- age_85_plus:

  Population aged 85 and over.

## Source

US Census Bureau, 2020 Decennial Census, Demographic and Housing
Characteristics (DHC) File, table P12. Retrieved via
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html).
<https://www.census.gov/data/tables/2023/dec/2020-census-dhc.html>
