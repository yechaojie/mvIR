##
step 1. Extract the IVs of exposure and covariate respectively, and take the union as the IV for the mvmr analysis of this group.
step 2. Extract the corresponding beta and se values of these IVs from the exposure, covariate, and outcome datasets (listed in the tables).
step 3. Use the MVMR::ivw_mvmr function for analysis execution
##
exposure_dat <- readxl::read_xlsx('*/MVMR_alm_mydata.xlsx')
MRMVInputObject <- MendelianRandomization::mr_mvinput(bx = cbind(exposure_dat$'beta.exp',exposure_dat$'beta.cov'), 
                                                      bxse = cbind(exposure_dat$'se.exp',exposure_dat$'se.cov'), 
                                                      by = exposure_dat$'beta.out', byse =exposure_dat$'se.out')
MRMVObject1 <- MendelianRandomization::mr_mvivw(MRMVInputObject,
                                                model = "default",
                                                correl = FALSE,
                                                distribution = "normal",
                                                alpha = 0.05)
