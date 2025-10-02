
mydata <- readxl::read_xlsx(
  "drugmydata_TGHDL.csv")
res <- TwoSampleMR::mr(mydata)