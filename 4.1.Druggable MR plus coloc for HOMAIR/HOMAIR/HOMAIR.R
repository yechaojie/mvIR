
mydata <- readxl::read_xlsx(
  "drugmydata_HOMAIR.csv")
res <- TwoSampleMR::mr(mydata)