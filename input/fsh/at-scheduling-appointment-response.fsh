/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      HL7® Austria FHIR® Scheduling Profile for AppointmentResponse.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Profile:        HL7ATSchedulingAppointmentResponse
Parent:         AppointmentResponse
Id:             at-scheduling-appointmentresponse
Title:          "HL7® AT Scheduling AppointmentResponse Profile"
Description:    "HL7® Austria FHIR® Scheduling Profile for appointmentresponse data in Austria."

// Replace references to FHIR resources with references to profiles
* appointment only Reference(HL7ATSchedulingAppointment)
* actor only Reference(HL7ATCorePatient or Group or HL7ATCorePractitioner or HL7ATCorePractitionerRole or RelatedPerson or Device or HL7ATSchedulingHealthcareService or Location)