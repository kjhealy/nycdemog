# nycdemog 0.0.3

* Ten new county-level datasets covering the five boroughs, mirroring the existing tract- and block-level tables: `nyc_county_20_race_df`, `nyc_county_20_adults_df`, `nyc_county_20_age_sex_df`, `nyc_county_20_household_df`, `nyc_county_acs_race_df`, `nyc_county_acs_income_df`, `nyc_county_acs_education_df`, `nyc_county_acs_employment_df`, `nyc_county_acs_housing_df`, and `nyc_county_acs_language_nativity_df`.
* `get_nyc_acs()` and `get_nyc_decennial()` gain support for `geography = "county"`, returning one row per borough keyed on a 5-character `geoid`.

# nycdemog 0.0.2

* `get_nyc_acs()` gains support for `geography = "puma"`, returning the 55 NYC Public Use Microdata Areas with a `county` (borough) label. The 2010 PUMA vintage is used for ACS endyears up to 2021 and the 2020 vintage for 2022 and later.
* New exported helper `nyc_pumas()` returns the NYC PUMA crosswalk for either vintage.

# nycdemog 0.0.1

* Initial release.
