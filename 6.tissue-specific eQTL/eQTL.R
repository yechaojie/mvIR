
data <- readxl::read_xlsx(
  "*/eqtl_1gene_4tissue_HOMAIR_5e08_EUR_LD_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)
