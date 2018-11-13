library(tidyverse)


# Q1: convert "CA-49-1" to "elections-poll-ca49-1.csv"

download.file(url = "https://github.com/TheUpshot/2018-live-poll-results/tree/master/data",
              destfile = "master.zip",
              quiet = TRUE,
              mode = "wb")



build_filename <- function(x){
  separate(x, into = c(state, district, wave), sep = "-")
  paste0("elections-poll-", str_to_lower(state), district, "-", wave, ".csv")
}

# Q2
get_path <- function(x){
  separate(x, into = c(state, district, wave), sep = "-")
  paste0("https://github.com/TheUpshot/2018-live-poll-results/blob/master/data/elections-poll-", 
         str_to_lower(state), district, "-", wave, ".csv")
}

get_path <- function(district, wave){
  paste0("https://github.com/TheUpshot/2018-live-poll-results/blob/master/data/elections-poll-", 
         district, "-", wave, ".csv")
}


# Q3
get_csv_link <- function(district, wave){
  paste0("https://raw.githubusercontent.com/TheUpshot/2018-live-poll-results/master/data/elections-poll-", 
         district, "-", wave, ".csv")
}

table_poll <- function(district, wave){
  poll_link <- get_csv_link(district, wave)
  poll <- read_csv(poll_link, col_names = TRUE)
  poll
}

# Q4
table_poll <- function(district, wave){
  district <- tolower(district)
  stopifnot(is.character(district))
  poll_link <- get_csv_link(district, wave)
  poll <- read_csv(poll_link, col_names = TRUE)
  poll
}





