
data <- readxl::read_xlsx(
  "*/UVMR_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)
