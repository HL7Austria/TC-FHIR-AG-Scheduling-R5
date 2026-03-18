Alias: $v2-0276 = http://terminology.hl7.org/CodeSystem/v2-0276

Instance: HL7ATSchedulingAppointmentExample01
InstanceOf: HL7ATSchedulingAppointment
Usage: #example
* status = #booked
* appointmentType = $v2-0276#CHECKUP "A routine check-up, such as an annual physical"
* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* description = "Physiotherapie - Einzelbehandlung 30 Minuten"
* start = "2025-06-01T09:00:00+02:00"
* end = "2025-06-01T09:30:00+02:00"
* minutesDuration = 30
* created = "2025-05-10T14:23:00+02:00"
* slot = Reference(Slot/HL7ATSchedulingSlotExample01-free)
* subject.reference = "Patient/HL7ATCorePatientExample01"
* participant[HL7ATCorePatient].actor = Reference(Patient/HL7ATCorePatientExample01) "Max Mustermann"
* participant[HL7ATCorePatient].required = true
* participant[HL7ATCorePatient].status = #accepted
* participant[HL7ATCorePractitioner].actor = Reference(Practitioner/HL7ATCorePractitionerExample01) "Melanie Musterärztin"
* participant[HL7ATCorePractitioner].required = true
* participant[HL7ATCorePractitioner].status = #accepted

