test_that("nyc_counties() returns the five NYC county names", {
  x <- nyc_counties()
  expect_type(x, "character")
  expect_length(x, 5)
  expect_setequal(x, c("New York", "Kings", "Queens", "Bronx", "Richmond"))
})

test_that("nyc_county_fips() returns the five NYC county FIPS codes", {
  x <- nyc_county_fips()
  expect_type(x, "character")
  expect_length(x, 5)
  expect_named(x, c("New York", "Kings", "Queens", "Bronx", "Richmond"))
  expect_setequal(unname(x), c("36061", "36047", "36081", "36005", "36085"))
})
