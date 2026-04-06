expect_nyc_keyed_tibble <- function(x, expected_cols) {
  obj_name <- deparse(substitute(x))
  expect_s3_class(x, "tbl_df")
  expect_true("geoid" %in% names(x), info = obj_name)
  expect_type(x$geoid, "character")
  expect_false(
    any(is.na(x$geoid)),
    label = paste0(obj_name, "$geoid has no NAs")
  )
  expect_true(
    all(substr(x$geoid, 1L, 5L) %in% nyc_county_fips()),
    label = paste0(obj_name, "$geoid prefixes are NYC counties")
  )
  expect_setequal(unique(x$county), names(nyc_county_fips()))
  for (col in expected_cols) {
    expect_true(
      col %in% names(x),
      info = paste(obj_name, "missing column", col)
    )
  }
}

test_that("nyc_block_20_race_df is a valid NYC-keyed tibble", {
  expect_nyc_keyed_tibble(
    nyc_block_20_race_df,
    c(
      "total_pop",
      "nh_white_alone",
      "nh_black_alone",
      "nh_asian_alone",
      "hispanic",
      "nh_white_prop",
      "hispanic_prop"
    )
  )
  expect_gt(nrow(nyc_block_20_race_df), 30000L)
})

test_that("nyc_block_20_adults_df is a valid NYC-keyed tibble", {
  expect_nyc_keyed_tibble(
    nyc_block_20_adults_df,
    c("total_pop", "adults", "children")
  )
  expect_gt(nrow(nyc_block_20_adults_df), 30000L)
  expect_false(any(nyc_block_20_adults_df$children < 0, na.rm = TRUE))
  expect_equal(
    nyc_block_20_adults_df$total_pop,
    nyc_block_20_adults_df$adults + nyc_block_20_adults_df$children
  )
})

test_that("nyc_tract_20_age_sex_df age bins sum to total_pop", {
  expect_nyc_keyed_tibble(
    nyc_tract_20_age_sex_df,
    c(
      "total_pop",
      "male",
      "female",
      "age_under_5",
      "age_5_17",
      "age_18_24",
      "age_25_34",
      "age_35_44",
      "age_45_54",
      "age_55_64",
      "age_65_74",
      "age_75_84",
      "age_85_plus"
    )
  )
  expect_gt(nrow(nyc_tract_20_age_sex_df), 2000L)
  with(nyc_tract_20_age_sex_df, {
    expect_equal(male + female, total_pop)
    expect_equal(
      age_under_5 +
        age_5_17 +
        age_18_24 +
        age_25_34 +
        age_35_44 +
        age_45_54 +
        age_55_64 +
        age_65_74 +
        age_75_84 +
        age_85_plus,
      total_pop
    )
  })
})

test_that("nyc_tract_20_household_df family/nonfamily split sums to total", {
  expect_nyc_keyed_tibble(
    nyc_tract_20_household_df,
    c(
      "total_households",
      "family_households",
      "nonfamily_households",
      "married_couple",
      "living_alone",
      "family_prop",
      "living_alone_prop"
    )
  )
  expect_gt(nrow(nyc_tract_20_household_df), 2000L)
  with(nyc_tract_20_household_df, {
    expect_equal(family_households + nonfamily_households, total_households)
  })
})

test_that("ACS tract tibbles have geoid + county and expected columns", {
  expect_nyc_keyed_tibble(
    nyc_tract_acs_race_df,
    c(
      "total_pop",
      "nh_white",
      "hispanic",
      "nh_white_moe",
      "hispanic_moe",
      "hispanic_prop"
    )
  )
  expect_nyc_keyed_tibble(
    nyc_tract_acs_income_df,
    c("med_hhinc", "med_hhinc_moe", "poverty_rate")
  )
  expect_nyc_keyed_tibble(
    nyc_tract_acs_education_df,
    c(
      "edu_total",
      "edu_bachelors",
      "bachelors_or_higher",
      "bachelors_or_higher_prop"
    )
  )
  expect_nyc_keyed_tibble(
    nyc_tract_acs_employment_df,
    c("lf_total", "lf_employed", "lf_unemployed", "unemployment_rate")
  )
  expect_nyc_keyed_tibble(
    nyc_tract_acs_housing_df,
    c(
      "hu_total",
      "tenure_owner",
      "tenure_renter",
      "median_value",
      "owner_occupied_prop"
    )
  )
  expect_nyc_keyed_tibble(
    nyc_tract_acs_language_nativity_df,
    c("lang_total", "lang_english_only", "foreign_born", "foreign_born_prop")
  )
  for (o in list(
    nyc_tract_acs_race_df,
    nyc_tract_acs_income_df,
    nyc_tract_acs_education_df,
    nyc_tract_acs_employment_df,
    nyc_tract_acs_housing_df,
    nyc_tract_acs_language_nativity_df
  )) {
    expect_gt(nrow(o), 2000L)
  }
})
