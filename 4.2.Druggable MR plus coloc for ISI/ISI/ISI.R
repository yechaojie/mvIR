
mydata <- readxl::read_xlsx(
  "drugmydata_ISI.csv")
res <- TwoSampleMR::mr(mydata)