
mydata <- readxl::read_xlsx(
  "*/mydata.xlsx")
res <- TwoSampleMR::mr(mydata)
