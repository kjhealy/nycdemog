# Shared setup and helpers for all data-raw scripts.
#
# Every nycdemog data-raw script should start with:
#
#   source(here::here("data-raw", "_shared.R"))
#   source(here::here("data-raw", "_variables.R"))
#
# This loads the in-development package (so the get_nyc_*() wrappers are
# available), pulls in tidyverse helpers, and exposes a small cache helper
# that lets us avoid re-hitting the Census API on every rebuild.

library(devtools)
library(here)
library(fs)
library(dplyr)
library(tidyr)
library(stringr)
library(purrr)
library(readr)
library(tibble)
library(janitor)
library(tidycensus)

# Make the wrappers available without installing the package.
devtools::load_all(quiet = TRUE)

# Cache directory for raw API pulls. Gitignored.
cache_dir <- here::here("data-raw", "_cache")
fs::dir_create(cache_dir)

# Cache the result of an expression to data-raw/_cache/<name>.rds.
#
# The first call evaluates `expr` and writes the result to disk; subsequent
# calls read it back. Pass `refresh = TRUE` to force a re-fetch.
cache_call <- function(name, expr, refresh = FALSE) {
  path <- fs::path(cache_dir, paste0(name, ".rds"))
  if (!refresh && fs::file_exists(path)) {
    return(readRDS(path))
  }
  result <- force(expr)
  saveRDS(result, path)
  result
}
