# loads the data and converts the column but also keeps a copy of 
# the original (_orig) column
getData <- function(){
  data <- readr::read_csv("data/Unified_WQ_Database_1995-2022.csv")
  data$Value_orig <- data$Value
  data$Value <- as.numeric(data$Value)
  return(data)
}
