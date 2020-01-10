#' Getting Read codes
#'
#' This function retrieves read codes from ICD codes.
#' @param string String to match. Can be single term, or vector. Case insensitive.
#' @param read Which read code version? Specify numeric,  2 or 3.
#' @keywords readcodes
#' @export stringToRead
#' @return If matches are found, returns vector of Read codes.
#' @import data.table
#' @importFrom magrittr %>%

stringToRead <- function(string, read) {

  if (!read %in% c(2, 3))
    stop("Please specify read codes version, 2 or 3")

  refName <- paste0("readv",read)
  ref <- refName %>% get

  codes <- ref[stringr::str_detect(description, stringr::regex(paste(string, collapse = "|"), ignore_case = TRUE)), readCode] %>%
    unique

  return(codes)

}
