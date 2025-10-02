
mydata <- readxl::read_xlsx(
  "drugmydata_Fins.csv")
res <- TwoSampleMR::mr(mydata)