% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ISODefinitionReference.R
\docType{class}
\name{ISODefinitionReference}
\alias{ISODefinitionReference}
\title{ISODefinitionReference}
\format{\code{\link{R6Class}} object.}
\usage{
ISODefinitionReference
}
\value{
Object of \code{\link{R6Class}} for modelling an ISODefinitionReference
}
\description{
ISODefinitionReference
}
\section{Fields}{

\describe{
\item{\code{definitionSource}}{}
}}

\section{Methods}{

\describe{
 \item{\code{new(xml)}}{
   This method is used to instantiate an ISODefinitionReference
 }
 \item{\code{setSourceIdentifier(identifier)}}{
   Sets the source identifier as object of class \code{character}
 }
 \item{\code{setDefinitionSource(source)}}{
   Sets the definition source as object of class \code{ISODefinitionSource} or
   directly using a \code{ISOCitation}
 }
}
}

\references{
ISO 19110:2005 Methodology for Feature cataloguing
}
\author{
Emmanuel Blondel <emmanuel.blondel1@gmail.com>
}
\keyword{ISO}
\keyword{definition}
\keyword{reference}
