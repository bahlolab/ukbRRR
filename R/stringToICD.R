#' Getting ICD9 codes from strings
#'
#' This function retrieves ICD9/10 codes based on string matching.
#' @param string String to match. Can be single term, or vector. Case insensitive.
#' @param ICD Which ICD? Specify numeric,  9 or 10.
#' @keywords ICD9 ICD10
#' @export stringToICD
#' @return If matches are found, returns vector of ICD code.
#' @import data.table
#' @importFrom magrittr %>%

stringToICD <- function(string, ICD) {

  if (!ICD %in% c(9, 10))
    stop("Please specify ICD 9 or 10")

  refName <- paste0("icd",ICD)
  ref <- refName %>% get

  codes <- ref[stringr::str_detect(description, stringr::regex(paste(string, collapse = "|"), ignore_case = TRUE)), icd] %>%
    unique


  return(codes)

}
