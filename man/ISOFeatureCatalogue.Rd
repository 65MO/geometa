% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ISOFeatureCatalogue.R
\docType{class}
\name{ISOFeatureCatalogue}
\alias{ISOFeatureCatalogue}
\title{ISOFeatureCatalogue}
\format{\code{\link{R6Class}} object.}
\usage{
ISOFeatureCatalogue
}
\value{
Object of \code{\link{R6Class}} for modelling an ISO FeatureCatalogue
}
\description{
ISOFeatureCatalogue
}
\section{Fields}{

\describe{
\item{\code{name}}{}
}}

\section{Inherited Methods from \code{ISOAbstractCatalogue}}{

\describe{
 \item{\code{setName(name)}}{
   Sets the name
 }
 \item{\code{addScope(scope)}}{
   Adds scope (object of class \code{character})
 }
 \item{\code{delScope(scope)}}{
   Deletes scope
 }
 \item{\code{addFieldOfApplication(fieldOfApplication)}}{
   Adds a field of application (object of class \code{character})
 }
 \item{\code{delFieldOfApplication(fieldOfApplication)}}{
   Deletes fieldOfApplication
 }
 \item{\code{setVersionNumber(versionNumber)}}{
   Sets version number (object of class \code{character})
 }
 \item{\code{setVersionDate(versionDate)}}{
   Sets version date
 }
}
}

\section{Methods}{

\describe{
 \item{\code{new(xml, uuid)}}{
   This method is used to instantiate an ISOFeatureCatalogue
 }
 \item{\code{setProducer(producer)}}{
   Sets an object of class \code{ISOResponsibleParty} as producer
 }
 \item{\code{setFunctionalLanguage(functionalLanguage)}}{
   Sets the functional language
 }
 \item{\code{addFeatureType(featureType)}}{
   Adds a feature type, object of class \code{ISOFeatureType}
 }
 \item{\code{delFeatureType(featureType)}}{
   Deletes a feature type, object of class \code{ISOFeatureType}
 }
 \item{\code{addDefinitionSource(source)}}{
   Adds a definition source, object of class \code{ISODefinitionSource} or
   \code{ISOCitation}
 }
 \item{\code{delDefinitionSource(source)}}{
   Deletes a definition source, object of class \code{ISODefinitionSource} or
   \code{ISOCitation}
 }
}
}

\examples{
 fc <- ISOFeatureCatalogue$new(uuid = "my-fc-identifier")
 fc$setName("name")
 fc$addScope("scope1")
 fc$addScope("scope2")
 fc$addFieldOfApplication("field1")
 fc$addFieldOfApplication("field2")
 fc$setVersionNumber("1.0")
 fc$setVersionDate(ISOdate(2015, 1, 1, 1))
 
 producer <- ISOResponsibleParty$new()
 producer$setIndividualName("someone")
 fc$setProducer(producer)
 fc$setFunctionalLanguage("eng")
 
 cit <- ISOCitation$new()
 cit$setTitle("some citation title")
 fc$addDefinitionSource(cit)
 #'  #add featureType
 ft <- ISOFeatureType$new()
 ft$setTypeName("typeName")
 ft$setDefinition("definition")
 ft$setCode("code")
 ft$setIsAbstract(FALSE)
 ft$addAlias("alias1")
 ft$addAlias("alias2")
 
 #add feature attributes
 for(i in 1:3){
   #create attribute
   fat <- ISOFeatureAttribute$new()
   fat$setMemberName(sprintf("name \%s",i))
   fat$setDefinition(sprintf("definition \%s",i))
   fat$setCardinality(lower=1,upper=1)
   fat$setCode(sprintf("code \%s",i))
   
   gml <- GMLBaseUnit$new(id = sprintf("ID\%s",i))
   gml$setDescriptionReference("someref")
   gml$setIdentifier("identifier", "codespace")
   gml$addName("name1", "codespace")
   gml$addName("name2", "codespace")
   gml$setQuantityTypeReference("someref")
   gml$setCatalogSymbol("symbol")
   gml$setUnitsSystem("somelink")
   fat$setValueMeasurementUnit(gml)
   
   #add listed values
   val1 <- ISOListedValue$new()
   val1$setCode("code1")
   val1$setLabel("label1")
   val1$setDefinition("definition1")
   fat$addListedValue(val1)
   val2 <- ISOListedValue$new()
   val2$setCode("code2")
   val2$setLabel("label2")
   val2$setDefinition("definition2")
   fat$addListedValue(val2)
   fat$setValueType("typeName")
   
   #add feature attribute as carrierOfCharacteristic
   ft$addCharacteristic(fat)
 }
 #add featureType to catalogue
 fc$addFeatureType(ft)
 
 xml <- fc$encode()
 
}
\references{
ISO 19110:2005 Methodology for Feature cataloguing
}
\author{
Emmanuel Blondel <emmanuel.blondel1@gmail.com>
}
\keyword{ISO}
\keyword{catalogue}
\keyword{feature}
