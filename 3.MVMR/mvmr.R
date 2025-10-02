## step 1. Extract the IVs of exposure and covariate respectively, and take the union as the IV for the mvmr analysis of this group.
## step 2. Extract the corresponding beta and se values of these IVs from the exposure, covariate, and outcome datasets (listed in the tables).
## step 3. Use the MVMR::ivw_mvmr function for analysis execution
## in sequence
exposure_dat <- readxl::read_xlsx('*/MVMR_alm_mydata.xlsx')
MRMVInputObject <- MendelianRandomization::mr_mvinput(bx = cbind(exposure_dat$'beta.exp',exposure_dat$'beta.cov'), 
                                                      bxse = cbind(exposure_dat$'se.exp',exposure_dat$'se.cov'), 
                                                      by = exposure_dat$'beta.out', byse =exposure_dat$'se.out')
MRMVObject1 <- MendelianRandomization::mr_mvivw(MRMVInputObject,
                                                model = "default",
                                                correl = FALSE,
                                                distribution = "normal",
                                                alpha = 0.05)

## loop
library(readxl)
library(MendelianRandomization)
library(dplyr)

fl <- list.files("3.MVMR", pattern = "\\.xlsx$", full.names = TRUE)
out  <- vector("list", length(fl)) |> setNames(basename(fl))

for (i in seq_along(fl)) {
  dat <- read_xlsx(fl[i])
  
  mv_in <- mr_mvinput(bx     = cbind(dat$`beta.exp`, dat$`beta.cov`),
                      bxse   = cbind(dat$`se.exp`,   dat$`se.cov`),
                      by     = dat$`beta.out`,
                      byse   = dat$`se.out`)
  
  out[[i]] <- mr_mvivw(mv_in, model = "default", correl = FALSE,
                       distribution = "normal", alpha = 0.05)
}

# optional: combine and export
final <- bind_rows(lapply(names(out), function(n) cbind(file = n, out[[n]])))
write.csv(final, "MVMR_results.csv", row.names = FALSE)

