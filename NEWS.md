# nycdemog 0.0.2

* `get_nyc_acs()` gains support for `geography = "puma"`, returning the 55 NYC Public Use Microdata Areas with a `county` (borough) label. The 2010 PUMA vintage is used for ACS endyears up to 2021 and the 2020 vintage for 2022 and later.
* New exported helper `nyc_pumas()` returns the NYC PUMA crosswalk for either vintage.

# nycdemog 0.0.1

* Initial release.
