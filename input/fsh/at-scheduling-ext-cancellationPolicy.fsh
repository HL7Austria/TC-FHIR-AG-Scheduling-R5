Extension:    CancellationPolicy
Id:           at-scheduling-ext-cancellationPolicy
Title:        "The policy for a cancellation"
Description:  "This Extension provides the information about the policy of a cancellation of an appointment. It can contain a time frame until when a cancellation is possible or what the fee for a cancellation will be."
Context: Appointment.cancellationReason, HealthcareService, Slot

* value[x] 0..0
* extension contains 
    cancelUntil 0..1 and
    cancellationFee 0..1
* extension[cancelUntil].value[x] only Duration
* extension[cancelUntil] ^short = "Information on how long before the planned start of an appointment a cancellation will be possible"
* extension[cancelUntil].extension 0..0
* extension[cancellationFee].value[x] only Money
* extension[cancellationFee] ^short = "Information about the costs in case of a cancellation"
* extension[cancellationFee].extension 0..0