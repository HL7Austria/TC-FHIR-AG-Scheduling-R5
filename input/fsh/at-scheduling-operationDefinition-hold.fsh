/*##############################################################################
# Type:       FSH-File for a FHIR® OperationDefinition
# About:      HL7® Austria FHIR® Scheduling Operation $hold.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Instance: slot-hold
InstanceOf: OperationDefinition
Usage: #definition

* name = "Hold_Slot_Operation"
* status = #active
* kind = #operation
* description = "Request for a hold on a selected Slot in order for the user to complete entering data for booking an appointment.  This operation follows the appointment availability interaction and precedes the booking.  The server determines if the nominated slot is still available (i.e., all the required actors and physical assets needed for the appointment are still available) and either accepts or rejects the hold request and updates the resource status accordingly. "
* affectsState = true
* code = #hold
* resource = #Slot
* system = false
* type = true
* instance = false

* parameter[0].name = #slot-reference
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A resource id for one of proposed Slots returned by a prior $find operation (e.g., Resource/1234).  References can be to an absolute URL, but servers only perform this operation on their own slots."
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(HL7ATSchedulingSlot)

* parameter[+].name = #slot-identifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "When slot-identifiers are provided, the server is expected to perform an internal lookup to identify the corresponding slot instance. The server SHALL reject the request if the provided identifiers do not resolve to a single slot instance."
* parameter[=].type = #Identifier

* parameter[+].name = #slot-status
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "To create a hold on the slot this parameter needs to have the value `busy-tentative` or `free` to release it."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(http://hl7.org/fhir/ValueSet/slotstatus)

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The response will be a Parameters resource consisting of the requested held Slot resource, an OperationOutcome with errors, warnings or information as a result of processing the operation and in upon successful creation of a hold a dateTime `held-until`, which signals when the hold is automatically released. The Appointment resource will have an updated `status` of \"busy-tentative\" if the hold is approved or  \"busy-unavailable\" if the hold is rejected."
* parameter[=].type = #Parameters