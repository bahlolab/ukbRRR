#' Getting Read codes
#'
#' This function retrieves read codes from ICD codes.
#' @param code ICD code to look up. Can be single term, or vector. Returned vector from getICD function can be used.
#' @param ICD Which ICD? Specify numeric,  9 or 10.
#' @param read Which read code version? Specify numeric,  2 or 3.
#' @keywords readcodes ICD9 ICD10
#' @export getRead
#' @return If matches are found, returns vector of Read codes.
#' @import data.table
#' @importFrom magrittr %>%

getRead <- function(code, ICD, read) {

  if (!ICD %in% c(9, 10))
    stop("Please specify ICD 9 or 10")

  if (!read %in% c(2, 3))
    stop("Please specify read codes version, 2 or 3")

  refName <- paste0("icd",ICD,"Readv",read)
  ref <- refName %>% get

  codes <- ref[icd %in% ICD, readCode]

  return(codes)

}
