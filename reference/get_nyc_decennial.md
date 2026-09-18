# Get Decennial Census data for New York City

A thin wrapper around
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html)
that hard-codes the five New York City counties, never downloads
geometry, and returns a tidy tibble keyed by `geoid` (lowercased) with a
`county` column ready for joining to the spatial objects in the
`nycmaps` package.

## Usage

``` r
get_nyc_decennial(
  variables,
  year = 2020,
  geography = c("tract", "block", "block group", "county"),
  sumfile = "pl",
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

  Decennial Census year. Defaults to `2020`. `2000` and `2010` are also
  accepted by `tidycensus`.

- geography:

  Geographic level. One of `"tract"` (default), `"block"`,
  `"block group"`, or `"county"`.

- sumfile:

  Census summary file. Defaults to `"pl"` (the redistricting file). For
  tract-level demographic and housing characteristics use `"dhc"`.

- summary_var:

  Optional summary (denominator) variable.

- output:

  `"wide"` (the default) or `"tidy"`.

- ...:

  Additional arguments forwarded to
  [`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html).

## Value

A tibble with `geoid` and `county` as the first two columns, followed by
the requested variables. The Census year and sumfile used are stored in
the `"decennial_year"` and `"decennial_sumfile"` attributes.

## See also

[`get_nyc_acs()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_acs.md),
[`load_nyc_variables()`](https://kjhealy.github.io/nycdemog/reference/load_nyc_variables.md),
[`nyc_counties()`](https://kjhealy.github.io/nycdemog/reference/nyc_counties.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# 2020 PL 94-171 race and Hispanic origin at the block level.
race_vars <- c(
  nh_white = "P2_005N",
  nh_black = "P2_006N",
  nh_asian = "P2_008N",
  hispanic = "P2_002N"
)
get_nyc_decennial(
  race_vars,
  geography = "block",
  sumfile = "pl",
  summary_var = "P1_001N"
)

# 2020 DHC household type at tract level.
get_nyc_decennial(
  c(family_hh = "H9_002N", nonfamily_hh = "H9_009N"),
  geography = "tract",
  sumfile = "dhc"
)

# 2020 PL 94-171 total population, one row per borough.
get_nyc_decennial(
  c(total_pop = "P1_001N"),
  geography = "county",
  sumfile = "pl"
)
} # }
```
