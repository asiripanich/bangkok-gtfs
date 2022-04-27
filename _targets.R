library(targets)
library(tarchetypes)
# Set target-specific options such as packages.
tar_option_set(packages = c("here", "fs", "R.utils", "curl", "rmarkdown", "gert", "dplyr"))
source(here::here("R", "functions.R"))

# End this file with a list of target objects.
list(
  tar_target(gtfs_url, get_gtfs_url(), format = "url"),
  tar_target(stop_url, get_stop_url(), format = "url"),
  tar_target(parking_url, get_parking_url(), format = "url"),
  tar_target(gtfs, download_file(gtfs_url)),
  tar_target(stop, download_file(stop_url)),
  tar_target(parking, download_file(parking_url)),
  tar_render(readme, here::here("README.Rmd"))
)
