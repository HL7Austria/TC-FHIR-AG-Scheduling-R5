Alias: $v2-0276 = http://terminology.hl7.org/CodeSystem/v2-0276

Instance: HL7ATSchedulingAppointmentExample01
InstanceOf: HL7ATSchedulingAppointment
Usage: #example
* status = #booked
* appointmentType = $v2-0276#CHECKUP "A routine check-up, such as an annual physical"
* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = "65"
* serviceType.concept.coding.display = "Physiotherapy"
* description = "Routineuntersuchung beim Hausarzt"
* start = "2025-06-01T09:00:00+02:00"
* end = "2025-06-01T09:30:00+02:00"
* minutesDuration = 30
* created = "2025-05-10T14:23:00+02:00"
* slot = Reference(Slot/HL7ATSchedulingSlotExample01-free)
* subject.reference = "Patient/HL7ATCorePatientExample01"
* participant[0].actor = Reference(Patient/HL7ATCorePatientExample01) "Max Mustermann"
* participant[=].required = true
* participant[=].status = #accepted
* participant[+].actor = Reference(Practitioner/HL7ATCorePractitionerExample01) "Melanie Musterärztin"
* participant[=].required = true
* participant[=].status = #accepted