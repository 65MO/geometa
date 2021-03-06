% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ISOGeographicBoundingBox.R
\docType{class}
\name{ISOGeographicBoundingBox}
\alias{ISOGeographicBoundingBox}
\title{ISOGeographicBoundingBox}
\format{\code{\link{R6Class}} object.}
\usage{
ISOGeographicBoundingBox
}
\value{
Object of \code{\link{R6Class}} for modelling an ISO GeographicBoundingBox
}
\description{
ISOGeographicBoundingBox
}
\section{Fields}{

\describe{
\item{\code{northBoundLatitude}}{}
}}

\section{Methods}{

\describe{
 \item{\code{new(xml, minx, miny, maxx, maxy, bbox)}}{
   This method is used to instantiate an ISOGeographicBoundingBox
 }
}
}

\examples{
  md <- ISOGeographicBoundingBox$new(minx = -180, miny = -90, maxx = 180, maxy = 90)
  xml <- md$encode()

}
\references{
ISO 19115:2003 - Geographic information -- Metadata
}
\author{
Emmanuel Blondel <emmanuel.blondel1@gmail.com>
}
\keyword{ISO}
\keyword{extent}
