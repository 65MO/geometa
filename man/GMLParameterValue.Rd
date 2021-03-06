% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GMLParameterValue.R
\docType{class}
\name{GMLParameterValue}
\alias{GMLParameterValue}
\title{GMLParameterValue}
\format{\code{\link{R6Class}} object.}
\usage{
GMLParameterValue
}
\value{
Object of \code{\link{R6Class}} for modelling an GML parameter value
}
\description{
GMLParameterValue
}
\section{Fields}{

\describe{
\item{\code{operationParameter}}{}
}}

\section{Methods}{

\describe{
 \item{\code{new(xml, defaults)}}{
   This method is used to instantiate a GML ParameterValue
 }
 \item{\code{setValue(value,uom)}}{
   Sets the value (object of class "numeric"), with unit of measure (uom)
 }
 \item{\code{setStringValue(value)}}{
   Sets a string value
 }
 \item{\code{setIntegerValue(value)}}{
   Sets an integer value
 }
 \item{\code{setBooleanValue(value)}}{
   Sets a boolean value
 }
 \item{\code{setValueFile(value)}}{
   Sets a file value
 }
 \item{\code{setOperationParameter(operationParameter)}}{
   Sets the operation parameter, object of class \code{GMLOperationParameter}
 }
}
}

\examples{
  gml <- GMLParameterValue$new()
  gml$setValue(1.1, "test")
  op <- GMLOperationParameter$new()
  op$setDescriptionReference("someref")
  op$setIdentifier("identifier", "codespace")
  op$addName("name1", "codespace")
  op$addName("name2", "codespace")
  op$setMinimumOccurs(2L)
  gml$setOperationParameter(op)
  xml <- gml$encode()

}
\references{
ISO 19136:2007 Geographic Information -- Geographic Markup Language.
  http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=32554 
  
  OGC Geography Markup Language. http://www.opengeospatial.org/standards/gml
}
\author{
Emmanuel Blondel <emmanuel.blondel1@gmail.com>
}
\keyword{GML}
\keyword{ISO}
\keyword{parameter}
\keyword{value}
