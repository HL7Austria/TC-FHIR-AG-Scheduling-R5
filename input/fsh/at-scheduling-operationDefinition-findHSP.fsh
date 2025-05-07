/*##############################################################################
# Type:       FSH-File for a FHIR® OperationDefinition
# About:      HL7® Austria FHIR® Scheduling Operation $findHSP.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Instance: healthcareService-provider-find
InstanceOf: OperationDefinition
Usage: #definition

* name = "Find_HealthcareService_Provider"
* status = #active
* kind = #operation
* description = "A query operation that allows to search for healthcare service providers that offer a specific healthcare service. The general information about the HealthcareService identification itself is already available in advance, either as resource or via codes. "
* affectsState = false
* code = #findHSP
* resource = #HealthcareService
* system = false
* type = true
* instance = false
* parameter[0].name = #healthcareService-reference
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The full HealthcareService resource can be provided for this operation. The HealthcareService SHALL have be active (HealthcareService.active=true). "
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(HL7ATSchedulingHealthcareService)
* parameter[+].name = #healthcareService-category
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The code of the category of the healthcare service. Each parameter value SHALL contain *both* the system property and the code property for a code using the general syntax `healthcareService-category=[system]|[code]`. See the examples below for how this is implemented."
* parameter[=].type = #string
* parameter[=].searchType = #token
* parameter[+].name = #healthcareService-type
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The code of the type of the healthcare service. Each parameter value SHALL contain *both* the system property and the code property for a code using the general syntax `healthcareService-type=[system]|[code]`. See the examples below for how this is implemented."
* parameter[=].type = #string
* parameter[=].searchType = #token
* parameter[+].name = #healthcareService-specialty
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The code of the specialty of the healthcare service. Each parameter value SHALL contain *both* the system property and the code property for a code using the general syntax `healthcareService-specialty=[system]|[code]`. See the examples below for how this is implemented."
* parameter[=].type = #string
* parameter[=].searchType = #token
* parameter[+].name = #healthcareService-location
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "The (physical) location where a healthcare service should be provided can be used as a search parameter."
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(Location)
* parameter[+].name = #healthcareService-zipCodeArea
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "The aera in which a healthcare service should be offered can be provided as search parameter. For that purpose the zip code(s) shall be used."
* parameter[=].type = #string
* parameter[=].searchType = #string
* parameter[+].name = #healthcareService-availability
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "The desired availabilities for the healthcare service. "
* parameter[=].type = #Availability
* parameter[+].name = #result
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The response will be a Bundle consisting of the HealthcareService resource and a list of healthcare service providers (Organization, Practitioner, PractitionerRole) that offer the requested service and an OperationOutcome with errors, warnings or information as a result of processing the operation."
* parameter[=].type = #Bundle