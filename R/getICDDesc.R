#' Getting ICD code descriptions
#'
#' This function retrieves ICD code descriptionss.
#' @param code Read code to look up. Can be single term, or vector. Returned vector from stringToICD or readToICD function can be used.
#' @param ICD Which ICD? Specify numeric,  9 or 10.
#' @keywords ICD9 ICD10
#' @export getICDDesc
#' @return If matches are found, returns data.tablecontaining ICD codes and descriptions.
#' @import data.table
#' @importFrom magrittr %>%

getICDDesc <- function(code, ICD) {

  if (!ICD %in% c(9, 10))
    stop("Please specify ICD 9 or 10")

  refName <- paste0("icd",ICD)
  ref <- refName %>% get

  descs <- ref[icd %in% code]

  return(descs)

}

