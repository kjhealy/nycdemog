#' Internal helpers
#'
#' These are not exported. They standardise the output of [tidycensus::get_acs()]
#' and [tidycensus::get_decennial()] into a tidy NYC-ready tibble and validate
#' the Census API key.
#'
#' @keywords internal
#' @name nycdemog-internal
NULL

# Check that a Census API key is available in the environment.
check_census_key <- function(call = rlang::caller_env()) {
  key <- Sys.getenv("CENSUS_API_KEY")
  if (!nzchar(key)) {
    cli::cli_abort(
      c(
        "No Census API key found.",
        i = "Set {.envvar CENSUS_API_KEY} or call {.fn tidycensus::census_api_key}.",
        i = "Get a key at {.url https://api.census.gov/data/key_signup.html}."
      ),
      call = call
    )
  }
  invisible(key)
}

# Standardise a tidycensus result for NYC use.
#
# - Lowercase column names
# - Move `geoid` to the front and add a `county` label. For tract / block /
#   block group results, the county is derived from the first five
#   characters of `geoid`. For PUMA results, the county (borough) is
#   looked up from the internal NYC PUMA crosswalk using the supplied
#   `vintage`, and rows outside NYC are dropped.
# - Optionally pivot from tidy long to wide
tidy_census_result <- function(
  x,
  output = c("wide", "tidy"),
  geography = "tract",
  vintage = "2020"
) {
  output <- rlang::arg_match(output)

  names(x) <- tolower(names(x))

  if (output == "wide" && "variable" %in% names(x)) {
    value_cols <- intersect(c("value", "estimate", "moe"), names(x))
    x <- tidyr::pivot_wider(
      x,
      names_from = "variable",
      values_from = dplyr::all_of(value_cols)
    )
    if (length(value_cols) == 1L) {
      # Decennial: a single `value_<var>` column per variable - drop prefix.
      prefix <- paste0(value_cols, "_")
      names(x) <- sub(paste0("^", prefix), "", names(x))
    } else if (all(c("estimate", "moe") %in% value_cols)) {
      # ACS: pair (estimate_<var>, moe_<var>) -> (<var>, <var>_moe).
      names(x) <- sub("^estimate_", "", names(x))
      names(x) <- sub("^moe_(.*)$", "\\1_moe", names(x))
    }
  }

  if (geography == "puma") {
    xwalk <- nyc_pumas_xwalk[
      nyc_pumas_xwalk$vintage == vintage,
      c("geoid", "county"),
      drop = FALSE
    ]
    x <- dplyr::inner_join(x, xwalk, by = "geoid")
  } else {
    fips <- nyc_county_fips()
    county_lookup <- stats::setNames(names(fips), unname(fips))
    x <- dplyr::mutate(
      x,
      county = unname(county_lookup[substr(.data$geoid, 1L, 5L)])
    )
  }

  dplyr::relocate(x, "geoid", "county")
}

# Resolve a year argument: if NULL, use the upstream default in `fn`.
resolve_year <- function(year, fn) {
  if (!is.null(year)) {
    return(year)
  }
  eval(formals(fn)$year)
}

# Map an ACS endyear to the PUMA vintage it uses. The Census Bureau
# switched from 2010-vintage to 2020-vintage PUMAs starting with the 2022
# 1-year and 5-year ACS releases.
puma_vintage_for_year <- function(year) {
  if (is.null(year) || year >= 2022) "2020" else "2010"
}
