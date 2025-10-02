## one by one or use loop
## one by one
mydata <- readxl::read_xlsx(
  "*/uvmrmydata_CKD.xlsx")
res <- TwoSampleMR::mr(mydata)

## loop
install.packages(c("readxl","dplyr","TwoSampleMR","writexl"))
library(readxl)
library(dplyr)
library(TwoSampleMR)
library(writexl)

## 1. 
file_path <- "uvmrmydata_pleiotropic_effect.xlsx"
sheet_names <- excel_sheets(file_path)

## 2. 
result_list <- setNames(vector("list", length(sheet_names)), sheet_names)

## 3. 
for (sheet in sheet_names) {
  cat(sprintf("【%s】Processing sheet: %s\n", Sys.time(), sheet))
  data <- read_xlsx(file_path, sheet = sheet)
  result_list[[sheet]] <- mr(data)
}

## 4. 
combined_results <- bind_rows(result_list, .id = "sheet")

## 5. 
write.csv(combined_results, "MR_all_sheets_results.csv", row.names = FALSE)
write_xlsx(list(MR_results = combined_results), "MR_all_sheets_results.xlsx")
cat(">>> All done! Results saved as MR_all_sheets_results.csv and .xlsx\n")

