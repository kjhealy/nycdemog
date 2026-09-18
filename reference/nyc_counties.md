# New York City county names

The five counties (boroughs) that make up New York City, in the form
expected by
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html)
and
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html)
(i.e. county *names*, not FIPS codes).

## Usage

``` r
nyc_counties()
```

## Value

A character vector of length 5: `"New York"`, `"Kings"`, `"Queens"`,
`"Bronx"`, `"Richmond"`.

## Examples

``` r
nyc_counties()
#> [1] "New York" "Kings"    "Queens"   "Bronx"    "Richmond"
```
