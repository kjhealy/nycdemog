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

test_that("nyc_pumas() defaults to the 2020 vintage with 55 NYC PUMAs", {
  x <- nyc_pumas()
  expect_s3_class(x, "tbl_df")
  expect_equal(names(x), c("puma", "geoid", "county"))
  expect_equal(nrow(x), 55L)
  expect_true(all(nchar(x$puma) == 5L))
  expect_true(all(nchar(x$geoid) == 7L))
  expect_true(all(startsWith(x$geoid, "36")))
  expect_setequal(
    unique(x$county),
    c("New York", "Kings", "Queens", "Bronx", "Richmond")
  )
})

test_that("nyc_pumas('2010') returns 55 distinct 2010-vintage PUMAs", {
  x <- nyc_pumas("2010")
  expect_equal(nrow(x), 55L)
  expect_false(identical(x$puma, nyc_pumas("2020")$puma))
})

test_that("nyc_pumas() rejects unknown vintages", {
  expect_error(nyc_pumas("2000"))
})
