# loads the data and converts the column but also keeps a copy of 
# the original (_orig) column
getRawData <- function(){
  data <- readr::read_csv(
    here::here("data/Unified_WQ_Database_1995-2022.csv"),
    show_col_types = FALSE)
  data$Value_orig <- data$Value
  data$Value <- as.numeric(data$Value)
  return(data)
}

getData <- function(){
  data <- readr::read_csv(
    here::here("data/df_cleaned.csv"),
    show_col_types = FALSE)
  data$Value_orig <- data$Value
  data$Value <- as.numeric(data$Value)
  return(data)
}
