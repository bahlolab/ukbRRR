#' Getting ICD code descriptions
#'
#' This function retrieves SQL query to get data for given read codes.
#' @param read2 Read codes v2 to look up. Can be single term, or vector. Can be NULL. Returned vector from stringToRead or ICDToRead function can be used.
#' @param read3 Read codes v3 to look up. Can be single term, or vector. Can be NULL. Returned vector from stringToRead or ICDToRead function can be used.
#' @param  table "gp_clinical", "gp_scripts" or "gp_registrations"
#' @keywords SQL query
#' @export getQuery
#' @return SQL query to get data for given read codes.

getQuery <- function(table, read2=NULL, read3=NULL) {

  if (!table %in% c("gp_clinical", "gp_scripts", "gp_registrations"))
    stop("Please specify table as gp_clinical, gp_scrips or gp_registrations")

  if (is.null(read2) & is.null(read3))
    stop("Please specify read2 and/or read3 codes")


  if(!is.null(read2)) {
   read2Combined <- paste(read2, collapse="', '")
  }

  if(!is.null(read3)) {
      read3Combined <- paste(read3, collapse="', '")
  }


  if(!is.null(read2) & is.null(read3)) {
    command <- paste0("select * from ",table," where read_2 in ('",read2Combined,"')")
  }

  if(is.null(read2) & !is.null(read3)) {
    command <- paste0("select * from ",table," where read_3 in ('",read3Combined,"')")
  }

  if(!is.null(read2) & !is.null(read3)) {
    command <- paste0("select * from ",table," where read_2 in ('",read2Combined,"') or read_3 in ('",read3Combined,"')")
  }


  return(command)

}

