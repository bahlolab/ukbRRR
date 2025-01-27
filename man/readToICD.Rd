% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ReadToICD.R
\name{readToICD}
\alias{readToICD}
\title{Getting ICD codes from Read codes}
\usage{
readToICD(code, ICD, read)
}
\arguments{
\item{code}{Read code to look up. Can be single term, or vector. Returned vector from stringToRead function can be used.}

\item{ICD}{Which ICD? Specify numeric,  9 or 10.}

\item{read}{Which read code version? Specify numeric, 2 or 3.}
}
\value{
If matches are found, returns vector of ICD codes.
}
\description{
This function retrieves ICD codes from read codes.
}
\keyword{ICD10}
\keyword{ICD9}
\keyword{readcodes}
