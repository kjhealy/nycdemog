# Look up Census variables

Convenience wrapper around
[`tidycensus::load_variables()`](https://walker-data.com/tidycensus/reference/load_variables.html)
for browsing the variable catalogues used by
[`get_nyc_acs()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_acs.md)
and
[`get_nyc_decennial()`](https://kjhealy.github.io/nycdemog/reference/get_nyc_decennial.md).
The result is identical to a direct `tidycensus` call; this function
exists so that all NYC-oriented Census helpers live in one place.

## Usage

``` r
load_nyc_variables(year, dataset, cache = TRUE)
```

## Arguments

- year:

  The year, or endyear, of the dataset.

- dataset:

  Dataset name. Common choices: `"acs5"`, `"pl"`, `"dhc"`, `"sf1"`. See
  [`tidycensus::load_variables()`](https://walker-data.com/tidycensus/reference/load_variables.html)
  for the full list.

- cache:

  Whether to cache the variable table on disk for re-use across
  sessions. Defaults to `TRUE` (the opposite of the upstream default,
  because caching is almost always what you want during package work).

## Value

A tibble of variable IDs, labels, and concepts.

## Examples

``` r
if (FALSE) { # \dontrun{
acs <- load_nyc_variables(2023, "acs5")
dplyr::filter(acs, grepl("median household income", label, ignore.case = TRUE))
} # }
```
