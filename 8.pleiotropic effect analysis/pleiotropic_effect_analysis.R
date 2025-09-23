
data <- readxl::read_xlsx(
  "*/uvmrmydata_CKD.xlsx")
res <- TwoSampleMR::mr(mydata)
