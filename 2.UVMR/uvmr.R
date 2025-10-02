## in sequence
mydata <- readxl::read_xlsx(
  "*/UVMR_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)

## loop
library(readxl)
library(TwoSampleMR)
library(dplyr)

file   <- "UVMR_mydata.xlsx"
sheets <- excel_sheets(file)
res    <- setNames(vector("list", length(sheets)), sheets)

for (sh in sheets) {
  dat <- read_xlsx(file, sheet = sh)
  res[[sh]] <- mr(dat)
}

final <- bind_rows(res, .id = "sheet")
write.csv(final, "UVMR_results.csv", row.names = FALSE)