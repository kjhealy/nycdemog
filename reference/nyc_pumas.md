# New York City Public Use Microdata Areas (PUMAs)

Returns the NYC PUMAs for a given vintage, each labelled with the
borough (as a county name, matching the convention used elsewhere in
this package) they fall in. NYC has 55 PUMAs in both the 2010 and 2020
vintages; the borough assignment was derived from a largest- overlap
spatial join between `nycmaps::nyc_pumas_*_sf` and
[`nycmaps::nyc_boros_sf`](https://rdrr.io/pkg/nycmaps/man/nyc_boros_sf.html)
and hard-coded into the package.

## Usage

``` r
nyc_pumas(vintage = c("2020", "2010"))
```

## Arguments

- vintage:

  PUMA vintage. One of `"2020"` (default) or `"2010"`.

## Value

A tibble with columns `puma` (5-character PUMA code), `geoid`
(7-character state + PUMA code, as returned by `tidycensus`), and
`county` (borough name as a county, e.g. `"Kings"`).

## Details

The 2010 vintage applies to ACS end-years up to and including 2021; the
2020 vintage applies to ACS end-years 2022 and later.

## Examples

``` r
nyc_pumas()
#> # A tibble: 55 × 3
#>    puma  geoid   county  
#>    <chr> <chr>   <chr>   
#>  1 04103 3604103 New York
#>  2 04104 3604104 New York
#>  3 04107 3604107 New York
#>  4 04108 3604108 New York
#>  5 04109 3604109 New York
#>  6 04110 3604110 New York
#>  7 04111 3604111 New York
#>  8 04112 3604112 New York
#>  9 04121 3604121 New York
#> 10 04165 3604165 New York
#> # ℹ 45 more rows
nyc_pumas("2010")
#> # A tibble: 55 × 3
#>    puma  geoid   county
#>    <chr> <chr>   <chr> 
#>  1 03701 3603701 Bronx 
#>  2 03702 3603702 Bronx 
#>  3 03703 3603703 Bronx 
#>  4 03704 3603704 Bronx 
#>  5 03705 3603705 Bronx 
#>  6 03706 3603706 Bronx 
#>  7 03707 3603707 Bronx 
#>  8 03708 3603708 Bronx 
#>  9 03709 3603709 Bronx 
#> 10 03710 3603710 Bronx 
#> # ℹ 45 more rows
```
