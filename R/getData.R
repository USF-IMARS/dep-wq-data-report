# loads the data and converts the column but also keeps a copy of 
# the original (_orig) column
getRawData <- function(){
  data <- readr::read_csv(
    here::here("data/Unified_WQ_Database(2023 updated).csv"),
    locale = readr::locale(encoding = "UTF-8"),
    show_col_types = FALSE) %>%
  mutate(  # Remove anything that's not a digit, a dot or a minus sign
    Value = gsub("[^0-9.-]", "", Value),
    Latitude = gsub("[^0-9.-]", "", Latitude),
    Longitude = gsub("[^0-9.-]", "", Longitude)
  ) %>%
  dplyr::mutate(
    # convert numeric 
    verbatimValue = Value,
    Value = as.numeric(Value),
    VerbatimLatitude = Latitude,
    Latitude = as.numeric(Latitude),
    verbatimLongitude = Longitude,
    Longitude = as.numeric(Longitude)
  )
  return(data)
}


getData <- function(){
  # gets the cleanest version of the data
  # data goes through multiple cleaning steps
  data <- readr::read_csv(
    here::here("data/df_cleaned_02.csv"),
    show_col_types = FALSE)
  data$Value_orig <- data$Value
  data$Value <- as.numeric(data$Value)
  return(data)
}
