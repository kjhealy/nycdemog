# Changelog

## nycdemog 0.0.3

- Ten new county-level datasets covering the five boroughs, mirroring
  the existing tract- and block-level tables: `nyc_county_20_race_df`,
  `nyc_county_20_adults_df`, `nyc_county_20_age_sex_df`,
  `nyc_county_20_household_df`, `nyc_county_acs_race_df`,
  `nyc_county_acs_income_df`, `nyc_county_acs_education_df`,
  `nyc_county_acs_employment_df`, `nyc_county_acs_housing_df`, and
  `nyc_county_acs_language_nativity_df`.
- [`get_nyc_acs()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_acs.md)
  and
  [`get_nyc_decennial()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_decennial.md)
  gain support for `geography = "county"`, returning one row per borough
  keyed on a 5-character `geoid`.

## nycdemog 0.0.2

- [`get_nyc_acs()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_acs.md)
  gains support for `geography = "puma"`, returning the 55 NYC Public
  Use Microdata Areas with a `county` (borough) label. The 2010 PUMA
  vintage is used for ACS endyears up to 2021 and the 2020 vintage for
  2022 and later.
- New exported helper
  [`nyc_pumas()`](https://kjhealy.github.io/nycdemog/reference/nyc_pumas.md)
  returns the NYC PUMA crosswalk for either vintage.

## nycdemog 0.0.1

- Initial release.
