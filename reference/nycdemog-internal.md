# Internal helpers

These are not exported. They standardise the output of
[`tidycensus::get_acs()`](https://walker-data.com/tidycensus/reference/get_acs.html)
and
[`tidycensus::get_decennial()`](https://walker-data.com/tidycensus/reference/get_decennial.html)
into a tidy NYC-ready tibble and validate the Census API key.
