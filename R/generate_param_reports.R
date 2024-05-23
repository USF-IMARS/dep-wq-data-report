# creates a report template .qmd for each parameter in the dataset
# 
# # Proceed if rendering the whole project, exit otherwise
# if (!nzchar(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"))) {
#   quit()
# }
library(tidyr)
library(dplyr)

# create the template
templ <- gsub(
  "\"Silica\"", "{{parameter_name}}", 
  readLines("parameter_report_template.qmd"))


dir.create("parameter_reports", showWarnings=FALSE)

source("R/getData.R")
data <- getRawData()
# print unique values in `Parameter` column
unique_parameters <- unique(data$Parameter)

for (wq_param in unique_parameters) {
  params = list(
    parameter_name = wq_param
  )
  print(glue::glue("=== creating template for '{wq_param}' ==="))
  
  writeLines(
    whisker::whisker.render(templ, params),
    file.path("parameter_reports", paste0(wq_param, ".qmd"))
  )
}