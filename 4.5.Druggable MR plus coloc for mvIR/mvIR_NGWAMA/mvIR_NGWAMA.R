
mydata <- readxl::read_xlsx(
  "drugmydata_mergedNGWAMAAV2_3.csv")
res <- TwoSampleMR::mr(mydata)