/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      HL7® Austria FHIR® Scheduling Profile for Appointment.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Profile:        HL7ATSchedulingAppointment
Parent:         Appointment
Id:             at-scheduling-appointment
Title:          "HL7® AT Scheduling Appointment Profile"
Description:    "HL7® Austria FHIR® Scheduling Profile for appointment data in Austria."

/*
* participant.actor only Reference(HL7ATCorePatient or HL7ATCorePractitioner or HL7ATSchedulingHealthcareService or Group or HL7ATCorePractitionerRole or CareTeam or RelatedPerson or Location) 
*/