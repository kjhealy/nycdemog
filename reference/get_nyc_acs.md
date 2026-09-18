# Get American Community Survey data for New York City

A thin wrapper around
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html)
that hard-codes New York City geographies, never downloads geometry, and
returns a tidy tibble keyed by `geoid` (lowercased) with a `county`
column (borough name) ready for joining to the spatial objects in the
`nycmaps` package.

## Usage

``` r
get_nyc_acs(
  variables,
  year = NULL,
  geography = c("tract", "block group", "county", "puma"),
  survey = "acs5",
  summary_var = NULL,
  output = c("wide", "tidy"),
  ...
)
```

## Arguments

- variables:

  A character vector (optionally named) of Census variable IDs. See
  [`load_nyc_variables()`](https://kjhealy.github.io/nycdemog/reference/load_nyc_variables.md)
  or
  [`tidycensus::load_variables()`](https://walker-data.com/tidycensus/reference/load_variables.html).

- year:

  ACS endyear. If `NULL` (the default), uses the
  [`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html)
  default, which is the most recent vintage that `tidycensus` supports.

- geography:

  Geographic level. One of `"tract"` (default), `"block group"`,
  `"county"`, or `"puma"`. For `"tract"`, `"block group"`, and
  `"county"` the request is restricted to the five NYC counties via
  `tidycensus`'s `county` argument. For `"puma"`, `tidycensus` does not
  accept a `county` filter, so all NY state PUMAs are requested and then
  filtered down to the 55 NYC PUMAs using an internal crosswalk. The
  crosswalk vintage is chosen from `year`: ACS endyears up to and
  including 2021 use the 2010 PUMA vintage, 2022 and later use the 2020
  vintage. See
  [`nyc_pumas()`](https://kjhealy.github.io/nycdemog/reference/nyc_pumas.md).

- survey:

  ACS sample, passed to
  [`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).
  Defaults to `"acs5"`.

- summary_var:

  Optional summary (denominator) variable.

- output:

  `"wide"` (the default) or `"tidy"`. When `"wide"`, the `variable`
  column is pivoted out so each variable becomes its own column.

- ...:

  Additional arguments forwarded to
  [`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html).

## Value

A tibble with `geoid` and `county` as the first two columns, followed by
the requested variables. The ACS endyear actually used is stored in the
`"acs_year"` attribute.

## See also

[`get_nyc_decennial()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_decennial.md),
[`load_nyc_variables()`](https://kjhealy.github.io/nycdemog/reference/load_nyc_variables.md),
[`nyc_counties()`](https://kjhealy.github.io/nycdemog/reference/nyc_counties.md),
[`nyc_pumas()`](https://kjhealy.github.io/nycdemog/reference/nyc_pumas.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Median household income, latest 5-year ACS, NYC tracts.
get_nyc_acs(c(med_hhinc = "B19013_001"))

# Same, but at the PUMA level.
get_nyc_acs(
  c(med_hhinc = "B19013_001"),
  geography = "puma"
)

# Same, but one row per borough.
get_nyc_acs(
  c(med_hhinc = "B19013_001"),
  geography = "county"
)

# Race and Hispanic origin, with total population as the denominator.
race_vars <- c(
  nh_white = "B03002_003",
  nh_black = "B03002_004",
  nh_asian = "B03002_006",
  hispanic = "B03002_012"
)
get_nyc_acs(race_vars, summary_var = "B03002_001")
} # }
```
