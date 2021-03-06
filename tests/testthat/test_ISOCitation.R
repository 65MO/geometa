# test_ISOCitation.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for ISOCitation.R
#=======================
require(geometa, quietly = TRUE)
require(testthat)

context("ISOCitation")

test_that("encoding",{
  
  #encoding
  md <- ISOCitation$new()
  md$setTitle("sometitle")
  d <- ISODate$new()
  d$setDate(ISOdate(2015, 1, 1, 1))
  d$setDateType("publication")
  md$addDate(d)
  expect_error(md$addDate("wrong date type"))
  md$setEdition("1.0")
  md$setEditionDate(ISOdate(2015, 1, 1, 1))
  expect_error(md$setEditionDate("wrong date type"))
  md$setIdentifier(ISOMetaIdentifier$new(code = "identifier"))
  expect_error(md$setIdentifier("wrong identifier type"))
  md$setPresentationForm("mapDigital")
  
  #adding a cited responsible party
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
  md$setCitedResponsibleParty(rp)
  expect_error(md$setCitedResponsibleParty("wrong party type"))
  
  expect_is(md, "ISOCitation")
  xml <- md$encode()
  expect_is(xml, "XMLInternalNode")
  
  #decoding
  md2 <- ISOCitation$new(xml = xml)
  xml2 <- md2$encode()
  
  expect_true(ISOAbstractObject$compare(md, md2))
  
})