# Concatenate all documentation files into R/data.R
doc_files <- fs::dir_ls("data-raw/_documentation", glob = "*.R")

# Read and combine all documentation
doc_content <- purrr::map_chr(doc_files, readr::read_file)

# Write to R/data.R
readr::write_file(
  paste(doc_content, collapse = "\n\n"),
  here::here("R", "data.R")
)
