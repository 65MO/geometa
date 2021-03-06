#' ISOCarrierOfCharacteristics
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @keywords ISO carrierOfCharacteristics
#' @return Object of \code{\link{R6Class}} for modelling an ISOCarrierOfCharacteristics
#' @format \code{\link{R6Class}} object.
#'
#' @field featureType
#' @field constrainedBy
#'
#' @section Methods:
#' \describe{
#'  \item{\code{new(xml, defaults)}}{
#'    This method is used to instantiate an ISOCarrierOfCharacteristics
#'  }
#'  \item{\code{setFeatureType(featureType)}}{
#'    Set a feature type, object of class \code{ISOFeatureType}
#'  }
#'  \item{\code{addConstraint(constraint)}}{
#'    Add constraint, object of class \code{ISOConstraint}
#'  }
#'  \item{\code{delConstraint(constraint)}}{
#'    Deletes constraint, object of class \code{ISOConstraint}
#'  }
#' }
#'  
#' @references 
#'   ISO 19110:2005 Methodology for Feature cataloguing
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ISOCarrierOfCharacteristics <- R6Class("ISOCarrierOfCharacteristics",
   inherit = ISOAbstractObject,
   private = list(
     xmlElement = "FC_CarrierOfCharacteristics",
     xmlNamespacePrefix = "GFC"
   ),
   public = list(
     
     #+ featureType [0..1]: ISOFeatureType
     featureType = NULL,
     #+ constrainedBy [0..*]: ISOConstraint
     constrainedBy = list(),
     
     initialize = function(xml = NULL, defaults = NULL){
       super$initialize(xml = xml, defaults = defaults)
     },
     
     #setFeatureType
     setFeatureType = function(featureType){
       if(!is(featureType, "ISOFeatureType")){
         stop("The argument should be an object of class 'ISOFeatureType'")
       }
       self$featureType <- featureType
     },
     
     #addConstraint
     addConstraint = function(constraint){
       if(!is(constraint, "ISOConstraint")){
         constraint <- ISOConstraint$new(description = constraint)
       }
       return(self$addListElement("constrainedBy", constraint))
     },
     
     #delConstraint
     delConstraint = function(constraint){
       if(!is(constraint, "ISOConstraint")){
         constraint <- ISOConstraint$new(description = constraint)
       }
       return(self$delListElement("constrainedBy", constraint))
     }
   )         
)