#' Getting ICD9 codes
#'
#' This function retrieves ICD9 codes based on string matching.
#' @param string String to match. Can be single term, or vector. Case insensitive.
#' @param refPath Path to reference file "all_lkps_maps.xlsx"
#' @keywords ICD9
#' @export getICD9
#' @importFrom magrittr %>%
#' @import data.table

getICD9 <- function(refPath, string) {

  if (!file.exists(paste0(refPath,"/all_lkps_maps.xlsx")))
    stop(paste0("all_lkps_maps.xlsx not found in ",refPath))

  ref <- openxlsx::read.xlsx(paste0(refPath,"/all_lkps_maps.xlsx"), "icd9_lkp") %>%
    data.table::as.data.table()

  codes <- ref[stringr::str_detect(DESCRIPTION_ICD9, stringr::regex(paste(string, collapse = "|"), ignore_case = TRUE)), ICD9]

  return(codes)

}
