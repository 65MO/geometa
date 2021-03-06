% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ISOAggregateInformation.R
\docType{class}
\name{ISOAggregateInformation}
\alias{ISOAggregateInformation}
\title{ISOAggregateInformation}
\format{\code{\link{R6Class}} object.}
\usage{
ISOAggregateInformation
}
\value{
Object of \code{\link{R6Class}} for modelling a ISO AggregateInformation
}
\description{
ISOAggregateInformation
}
\section{Fields}{

\describe{
\item{\code{initiativeType}}{}
}}

\section{Methods}{

\describe{
 \item{\code{new(xml)}}{
   This method is used to instantiate an ISOAggregateInformation
 }
 \item{\code{setAggregateDataSetName(datasetName)}}{
   Sets aggregate dataset name, as an object of class \code{ISOCitation}
 }
 \item{\code{setAggregateDataSetIdentifier(datasetIdentifier)}}{
   Sets aggregate dataset identifier, as an object of class \code{ISOMetaIdentifier}
 }
 \item{\code{setAssociationType(associationType)}}{
   Sets the association type
 }
 \item{\code{setInitiativeType(initiativeType))}}{
   Sets the initiative type
 }
}
}

\examples{
  #encoding
  md <- ISOAggregateInformation$new()
  
  #adding a point of contact
  rp <- ISOResponsibleParty$new()
  rp$setIndividualName("someone")
  rp$setOrganisationName("somewhere")
  rp$setPositionName("someposition")
  rp$setRole("pointOfContact")
  contact <- ISOContact$new()
  phone <- ISOTelephone$new()
  phone$setVoice("myphonenumber")
  phone$setFacsimile("myfacsimile")
  contact$setPhone(phone)
  address <- ISOAddress$new()
  address$setDeliveryPoint("theaddress")
  address$setCity("thecity")
  address$setPostalCode("111")
  address$setCountry("France")
  address$setEmail("someone@theorg.org")
  contact$setAddress(address)
  res <- ISOOnlineResource$new()
  res$setLinkage("http://www.somewhereovertheweb.org")
  res$setName("somename")
  contact$setOnlineResource(res)
  rp$setContactInfo(contact)
  #citation
  ct <- ISOCitation$new()
  ct$setTitle("sometitle")
  d <- ISODate$new()
  d$setDate(ISOdate(2015, 1, 1, 1))
  d$setDateType("publication")
  ct$addDate(d)
  ct$setEdition("1.0")
  ct$setEditionDate(ISOdate(2015,1,1))
  ct$setIdentifier(ISOMetaIdentifier$new(code = "identifier"))
  ct$setPresentationForm("mapDigital")
  ct$setCitedResponsibleParty(rp)
  md$setAggregateDataSetName(ct)
  
  md$setAssociationType("source")
  md$setInitiativeType("investigation")
  
  xml <- md$encode()
  
}
\references{
ISO 19115:2003 - Geographic information -- Metadata
}
\author{
Emmanuel Blondel <emmanuel.blondel1@gmail.com>
}
\keyword{ISO}
\keyword{aggregated}
\keyword{information}
