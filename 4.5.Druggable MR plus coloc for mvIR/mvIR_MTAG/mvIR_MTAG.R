
mydata <- readxl::read_xlsx(
  "drugmydata_mergedMTAGmeta_V2.csv")
res <- TwoSampleMR::mr(mydata)