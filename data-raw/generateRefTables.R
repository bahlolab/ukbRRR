## Generates RData files

library(openxlsx)
library(data.table)
library(tidyverse)

################################################################
## ICD9 codes and descriptions
icd9 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "icd9_lkp") %>%
  as.data.table() %>%
  .[1:7971] %>%
  setnames(., c("icd", "description"))

save(icd9, file = "../data/icd9.RData")


################################################################
## ICD10 codes and descriptions
icd10 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "icd10_lkp") %>%
  as.data.table() %>%
  .[1:17934, .(ICD10_CODE, DESCRIPTION)] %>%
  setnames(., c("icd", "description"))

  save(icd10, file = "../data/icd10.RData")


################################################################
## ICD9 codes and read codes v2 mapping
icd9Readv2 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "read_v2_icd9") %>%
  as.data.table() %>%
  .[1:35661, .(read_code, icd9_code)] %>%
    setnames(., c("readCode", "icd"))

save(icd9Readv2, file = "../data/icd9Readv2.RData")


################################################################
## ICD9 codes and read codes v3 mapping
icd9Readv3 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "read_ctv3_icd9") %>%
  as.data.table() %>%
  .[1:67153, .(read_code, icd9_code)]  %>%
  setnames(., c("readCode", "icd"))

save(icd9Readv3, file = "../data/icd9Readv3.RData")


################################################################
## ICD10 codes and read codes v2 mapping
icd10Readv2 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "read_v2_icd10") %>%
  as.data.table() %>%
  .[1:35664, .(read_code, icd10_code)]  %>%
  setnames(., c("readCode", "icd"))

save(icd10Readv2, file = "../data/icd10Readv2.RData")


################################################################
## ICD9 codes and read codes v3 mapping
icd10Readv3 <- openxlsx::read.xlsx("all_lkps_maps.xlsx", "read_ctv3_icd10") %>%
  as.data.table() %>%
  .[1:116374, .(read_code, icd10_code)]  %>%
  setnames(., c("readCode", "icd"))

save(icd10Readv3, file = "../data/icd10Readv3.RData")
