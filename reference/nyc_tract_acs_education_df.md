# New York City educational attainment by Census tract, ACS 5-year

Educational attainment for the population 25 years and over from the
2020-2024 American Community Survey 5-year release for the five New York
City counties at the Census tract level. Sourced from ACS table B15003.
Each estimate is accompanied by its 90% margin of error, with the suffix
`_moe`. Joins to
[nycmaps::nyc_census_tracts_2020_sf](https://rdrr.io/pkg/nycmaps/man/nyc_census_tracts_2020_sf.html)
on `geoid`.

## Usage

``` r
nyc_tract_acs_education_df
```

## Format

A tibble with 2,327 rows and 26 columns:

- geoid:

  11-character tract GEOID.

- county:

  NYC county (borough) name derived from `geoid`.

- name:

  Census tract label as returned by the Census Bureau.

- edu_total:

  Population 25 years and over (`B15003_001`).

- edu_less_than_hs:

  No schooling completed (`B15003_002`).

- edu_some_hs:

  9th to 12th grade, no diploma (`B15003_016`).

- edu_hs:

  Regular high school diploma (`B15003_017`).

- edu_some_college:

  Some college, 1 or more years, no degree (`B15003_019`).

- edu_associates:

  Associate's degree (`B15003_021`).

- edu_bachelors:

  Bachelor's degree (`B15003_022`).

- edu_masters:

  Master's degree (`B15003_023`).

- edu_professional:

  Professional school degree (`B15003_024`).

- edu_doctorate:

  Doctorate degree (`B15003_025`).

- edu_total_moe, edu_less_than_hs_moe, edu_some_hs_moe, edu_hs_moe,
  edu_some_college_moe, edu_associates_moe, edu_bachelors_moe,
  edu_masters_moe, edu_professional_moe, edu_doctorate_moe:

  Margins of error for the corresponding estimates.

- bachelors_or_higher:

  `edu_bachelors + edu_masters + edu_professional + edu_doctorate`.

- bachelors_or_higher_prop:

  Proportion of `edu_total` with a bachelor's degree or higher. `NA`
  when `edu_total == 0`.

- less_than_hs_prop:

  Proportion of `edu_total` whose highest attainment is below a high
  school diploma.

## Source

US Census Bureau, 2020-2024 American Community Survey 5-year estimates,
table B15003. Retrieved via
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
<https://www.census.gov/programs-surveys/acs>
