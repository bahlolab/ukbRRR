#' Getting Read code descriptions
#'
#' This function retrieves read codes descriptions.
#' @param code Read code to look up. Can be single term, or vector. Returned vector from stringToRead or ICDToRead function can be used.
#' @param read Which read code version? Specify numeric,  2 or 3.
#' @keywords readcodes
#' @export getReadDesc
#' @return If matches are found, returns data.tablecontaining Read codes and descriptions.
#' @import data.table
#' @importFrom magrittr %>%

getReadDesc <- function(code, read) {

  if (!read %in% c(2, 3))
    stop("Please specify read codes version, 2 or 3")

  refName <- paste0("readv",read)
  ref <- refName %>% get

  descs <- ref[readCode %in% code]

  return(descs)

}
