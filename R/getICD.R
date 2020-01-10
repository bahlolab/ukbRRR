#' Getting ICD9 codes
#'
#' This function retrieves ICD9 codes based on string matching.
#' @param string String to match. Can be single term, or vector. Case insensitive.
#' @param ICD Which ICD? Specify numeric,  9 or 10.
#' @keywords ICD9 ICD10
#' @export getICD
#' @return If matches are found, returns vector of ICD code.
#' @importFrom magrittr %>%
#' @import data.table

getICD <- function(string, ICD) {

  if (!ICD %in% c(9, 10))
    stop("Please specify ICD 9 or 10")

  if(ICD == 9) {

  load("data/icd9.RData")
  codes <- icd9[stringr::str_detect(DESCRIPTION_ICD9, stringr::regex(paste(string, collapse = "|"), ignore_case = TRUE)), ICD9]

  } else if(ICD == 10) {

    load("data/icd10.RData")
    codes <- icd10[stringr::str_detect(DESCRIPTION_ICD10, stringr::regex(paste(string, collapse = "|"), ignore_case = TRUE)), ICD10]

  }

  return(codes)

}
