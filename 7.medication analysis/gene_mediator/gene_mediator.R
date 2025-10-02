
mydata <- readxl::read_xlsx(
  "*/21gene_mediator_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)
