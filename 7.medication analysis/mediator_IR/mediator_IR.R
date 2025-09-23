
data <- readxl::read_xlsx(
  "*/mediator_Fins_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)
