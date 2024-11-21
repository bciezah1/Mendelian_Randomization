# Install the TwoSampleMR package if you haven't already
#install.packages("devtools")
#devtools::install_github("MRCIEU/TwoSampleMR")

# Load the package
library(TwoSampleMR)

###################################
# STEP 1: load exposure and outcome
###################################

# Updated Exposure Data with all necessary columns
exposure_data <- data.frame(
  SNP = c("rs123", "rs456", "rs789"),
  beta.exposure = c(0.05, 0.08, 0.03),     # Effect of SNP on exposure
  se.exposure = c(0.01, 0.02, 0.015),      # Standard error for the exposure effect
  effect_allele.exposure = c("A", "C", "G"),
  other_allele.exposure = c("T", "G", "T"),
  eaf.exposure = c(0.3, 0.4, 0.25),        # Effect allele frequency for exposure
  pval.exposure = c(1e-5, 5e-3, 2e-4),     # p-value of association with exposure
  id.exposure = "exposure1",               # Unique ID for this exposure dataset
  exposure = "Trait_A"                     # Name of the exposure trait
)
head(exposure_data)

# Updated Outcome Data with all necessary columns
outcome_data <- data.frame(
  SNP = c("rs123", "rs456", "rs789"),
  beta.outcome = c(0.07, -0.02, 0.05),     # Effect of SNP on outcome
  se.outcome = c(0.02, 0.015, 0.02),       # Standard error for the outcome effect
  effect_allele.outcome = c("A", "C", "G"),
  other_allele.outcome = c("T", "G", "T"),
  eaf.outcome = c(0.3, 0.35, 0.28),        # Effect allele frequency for outcome
  pval.outcome = c(1e-4, 3e-2, 1e-3),      # p-value of association with outcome
  id.outcome = "outcome1",                 # Unique ID for this outcome dataset
  outcome = "Trait_B"                      # Name of the outcome trait
)
head(outcome_data)

###################################
# STEP 2: Harmonize
###################################

# Harmonize the updated exposure and outcome data
harmonized_data <- harmonise_data(exposure_dat = exposure_data, outcome_dat = outcome_data)

###################################
# STEP 3: Performe MR
###################################

# Single-SNP MR analysis
single_snp_results <- mr_singlesnp(harmonized_data)

# Print results
print(single_snp_results)

###################################
# STEP 4: Loading real data
###################################


