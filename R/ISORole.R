#' ISORole
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @keywords ISO role
#' @return Object of \code{\link{R6Class}} for modelling an ISO Role
#' @format \code{\link{R6Class}} object.
#'
#' @field value
#'
#' @section Methods:
#' \describe{
#'  \item{\code{new(xml,value)}}{
#'    This method is used to instantiate an ISORole
#'  }
#' }
#' 
#' @examples 
#'   #possible values
#'   values <- ISORole$values(labels = TRUE)
#'   
#'   #publisher restriction
#'   role <- ISORole$new(value = "publisher")
#'   
#' @references 
#'   ISO 19115:2003 - Geographic information -- Metadata
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ISORole <- R6Class("ISORole",
  inherit = ISOCodeListValue,
  private = list(
    xmlElement = "CI_RoleCode",
    xmlNamespacePrefix = "GMD"
  ),
  public = list(
    initialize = function(xml = NULL, value){
      super$initialize(xml = xml, id = private$xmlElement, value = value, setValue = TRUE)
    }
  )                        
)

ISORole$values <- function(labels = FALSE){
  return(ISOCodeListValue$values(ISORole, labels))
}