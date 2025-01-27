% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stringToRead.R
\name{stringToRead}
\alias{stringToRead}
\title{Getting Read codes}
\usage{
stringToRead(string, read)
}
\arguments{
\item{string}{String to match. Can be single term, or vector. Case insensitive.}

\item{read}{Which read code version? Specify numeric,  2 or 3.}
}
\value{
If matches are found, returns vector of Read codes.
}
\description{
This function retrieves read codes from ICD codes.
}
\keyword{readcodes}
