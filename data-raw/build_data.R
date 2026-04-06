# Build all data objects
# This script sources all data-raw scripts to build all package data objects

# Get all R scripts in data-raw (excluding those starting with _ or build_)
data_scripts <- fs::dir_ls(
  here::here("data-raw"),
  glob = "*.R"
) |>
  stringr::str_subset("^(?!.*(_|build_)).*\\.R$")

# Source each script
purrr::walk(data_scripts, source)

message("All data objects built successfully")
