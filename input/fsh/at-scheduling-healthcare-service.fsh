/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      HL7® Austria FHIR® Scheduling Profile for HealthcareService.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Profile:        HL7ATSchedulingHealthcareService
Parent:         HealthcareService
Id:             at-scheduling-healthcareservice
Title:          "HL7® AT Scheduling HealthcareService Profile"
Description:    "HL7® Austria FHIR® Scheduling Profile for healthcareservice data in Austria."

* providedBy only Reference(HL7ATCoreOrganization)
* offeredIn only Reference(HL7ATSchedulingHealthcareService)