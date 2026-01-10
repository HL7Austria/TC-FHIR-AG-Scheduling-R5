Extension:    AppointmentPostponementReasonExt
Id:           appointment-postponementReason
Title:        "Appointment Postponement Reason"
Description:  "The reason why an appointment was postoponed. This is often used in reporting/billing/further processing to determine if further actions are required, or specific fees apply."
Context: Appointment

* value[x] only CodeableConcept
* value[x] from http://hl7.org/fhir/ValueSet/appointment-cancellation-reason (extensible)
* extension 0..0