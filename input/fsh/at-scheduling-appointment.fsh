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

// Replace references to FHIR resources with references to profiles
* serviceType only CodeableReference(HL7ATSchedulingHealthcareService)
// Add binding to AtSchedulungServiceType
* serviceType from AtSchedulingServiceType (extensible)

* replaces only Reference(HL7ATSchedulingAppointment)
* previousAppointment only Reference(HL7ATSchedulingAppointment)
* originatingAppointment only Reference(HL7ATSchedulingAppointment)

* slot only Reference(HL7ATSchedulingSlot)

* subject only Reference(HL7ATCorePatient or Group)

// Participant slicing Inspired by https://github.com/gematik/spec-ISiK-Terminplanung/blob/main-stufe-4/Resources/input/fsh/ISiKTermin.fsh
* participant MS
  * actor 1..1 MS

    * display MS
      * ^comment = "ToDo"
  * status 1..1 MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "actor.resolve()"
  * ^slicing.rules = #open
* participant ^comment = "ToDo"

* participant contains HL7ATCorePatient 1.. MS
* participant[HL7ATCorePatient].actor only Reference(Patient)
* participant[HL7ATCorePatient].actor MS
* participant[HL7ATCorePatient].actor.reference 1..1 MS
* participant[HL7ATCorePatient] ^comment = "ToDo"

* participant contains HL7ATCorePractitioner 0.. MS
* participant[HL7ATCorePractitioner].actor only Reference(Practitioner)
* participant[HL7ATCorePractitioner].actor MS
* participant[HL7ATCorePractitioner].actor.reference 1..1 MS
* participant[HL7ATCorePractitioner] ^comment = "ToDo"

* participant contains HL7ATCorePractitionerRole 0.. MS
* participant[HL7ATCorePractitionerRole].actor only Reference(PractitionerRole)
* participant[HL7ATCorePractitionerRole].actor MS
* participant[HL7ATCorePractitionerRole].actor.reference 1..1 MS
* participant[HL7ATCorePractitionerRole] ^comment = "ToDo"

* participant contains HL7ATSchedulingHealthcareService 0.. MS
* participant[HL7ATSchedulingHealthcareService].actor only Reference(HealthcareService)
* participant[HL7ATSchedulingHealthcareService].actor MS
* participant[HL7ATSchedulingHealthcareService].actor.reference 1..1 MS
* specialty MS
  * ^comment = "ToDo"
