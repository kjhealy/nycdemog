# New York City sex and age by Census tract, 2020

Total population, sex, and ten standard age bins for the five New York
City counties at the 2020 Census tract level. Sourced from the 2020
Decennial Census Demographic and Housing Characteristics (DHC) file,
table P12 ("Sex by age for selected age categories"). Each age bin is
the sum of the corresponding male and female detail categories from P12,
so the bins sum exactly to `total_pop` and `male + female` equals
`total_pop`. Joins to
[nycmaps::nyc_census_tracts_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_tracts_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_tract_20_age_sex_df
```

## Format

A tibble with 2,327 rows and 16 columns:

- geoid:

  11-character tract GEOID (state + county + tract).

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census tract label as returned by the Census Bureau.

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
