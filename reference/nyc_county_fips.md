# County FIPS codes for the five New York City counties

Returned as a named character vector. Useful for filtering or validating
`geoid` columns whose first five characters encode the state + county
FIPS.

## Usage

``` r
nyc_county_fips()
```

## Value

A named character vector of length 5.

## Examples

``` r
nyc_county_fips()
#> New York    Kings   Queens    Bronx Richmond 
#>  "36061"  "36047"  "36081"  "36005"  "36085" 
```
