get_gtfs_url <- function() {
    "https://namtang-api.otp.go.th/download/namtang-gtfs.zip"
}

get_parking_url <- function() {
    "https://namtang-api.otp.go.th/download/namtang-parking.txt.gz"
}

get_stop_url <- function() {
    "https://namtang-api.otp.go.th/download/namtang-stop.txt.gz"
}

download_file <- function(url) {
    filepath <- here::here("data", basename(url))
    download.file(url, filepath)

    if (grepl("txt.gz$", url)) {
        R.utils::gunzip(filepath, overwrite = TRUE)
        return()
    }
    
    if (grepl(".zip$", url)) {
        unzip(filepath, exdir = fs::path(dirname(filepath), "gtfs"))
        file.remove(filepath)
        return()
    }
}
