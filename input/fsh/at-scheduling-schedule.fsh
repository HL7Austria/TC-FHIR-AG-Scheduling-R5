/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      HL7® Austria FHIR® Scheduling Profile for Schedule.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Profile:        HL7ATSchedulingSchedule
Parent:         Schedule
Id:             at-scheduling-schedule
Title:          "HL7® AT Scheduling Schedule Profile"
Description:    "HL7® Austria FHIR® Scheduling Profile for schedule data in Austria."


// Replace references to FHIR resources with references to profiles
* actor only Reference(HL7ATCorePatient or HL7ATCorePractitioner or HL7ATCorePractitionerRole or CareTeam or RelatedPerson or Device or HL7ATSchedulingHealthcareService or Location)

// Add binding to AtSchedulungServiceType
* serviceType from AtSchedulingServiceType (extensible)
