## Generates RData files

library(openxlsx)
library(data.table)
library(tidyverse)

################################################################
## ICD9 codes and descriptions
icd9 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "icd9_lkp") %>%
  as.data.table() %>%
  .[1:7971]

save(icd9, file = "../data/icd9.RData")


################################################################
## ICD10 codes and descriptions
icd10 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "icd10_lkp") %>%
  as.data.table() %>%
  .[1:17934, .(ICD10_CODE, DESCRIPTION)] %>%
  setnames(., c("ICD10", "DESCRIPTION_ICD10"))

  save(icd10, file = "../data/icd10.RData")
