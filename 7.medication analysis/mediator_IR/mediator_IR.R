## in sequence
mydata <- readxl::read_xlsx(
  "*/mediator_Fins_mydata.xlsx")
res <- TwoSampleMR::mr(mydata)

## loop
install.packages(c("readxl","dplyr","TwoSampleMR"))
library(readxl)
library(dplyr)
library(TwoSampleMR)
## 1. 
file_paths <- list.files(path = "mediator_IR", pattern = "\\.xlsx$", full.names = TRUE)

## 2. 
result_list <- setNames(vector("list", length(file_paths)), basename(file_paths))

## 3. 
for (file in file_paths) {
  cat(sprintf("【%s】Processing file: %s\n", Sys.time(), basename(file)))
  data <- read_xlsx(file)
  result_list[[basename(file)]] <- mr(data)
}

## 4. 
combined_results <- bind_rows(result_list, .id = "filename")

## 5. 
write.csv(combined_results, "MR_mediator_IR_results.csv", row.names = FALSE)
cat(">>> All done! Results saved as MR_mediator_IR_results.csv\n")

