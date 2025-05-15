Alias: $v2-0276 = http://terminology.hl7.org/CodeSystem/v2-0276

Instance: HL7ATSchedulingAppointmentExample01
InstanceOf: Appointment
Usage: #example
* status = #booked
* description = "Routineuntersuchung beim Hausarzt"
* start = "2025-06-01T09:00:00+02:00"
* end = "2025-06-01T09:30:00+02:00"
* created = "2025-05-10T14:23:00+02:00"
* participant[0].actor = Reference(Patient/HL7ATCorePatientExample01) "Max Mustermann"
* participant[=].status = #accepted
* participant[=].required = true
* participant[+].actor = Reference(Practitioner/HL7ATCorePractitionerExample01) "Melanie Musterärztin"
* participant[=].status = #accepted
* participant[=].required = true
* appointmentType = $v2-0276#CHECKUP "Routineuntersuchung"
* minutesDuration = 30