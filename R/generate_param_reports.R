# Proceed if rendering the whole project, exit otherwise
if (!nzchar(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"))) {
  quit()
}
templ <- readLines("parameter_report_template.whisker")
dir.create("parameter_reports", showWarnings=FALSE)

source("R/getData.R")
data <- getData()
# print unique values in `Parameter` column
unique_parameters <- unique(data$Parameter)

for (wq_param in unique_parameters) {
  params = list(
    parameter_name = wq_param
  )

  writeLines(
    whisker::whisker.render(templ, params),
    file.path("parameter_reports", paste0(wq_param, ".qmd"))
  )
}