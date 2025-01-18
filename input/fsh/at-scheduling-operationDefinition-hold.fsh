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
* description = "Request for a hold on a selected Slot in order for the user to complete entering data for booking an appointment.  This operation precedes the booking and follows the appointment availability interaction.  The server determines if the nominated slot is still available (i.e., all the required actors and physical assets needed for the appointment are still available) and either accepts or rejects the hold request and updates the resource status accordingly. "
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
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The response will be a Parameters resource consisting of the requested held Slot resource and an OperationOutcome with errors, warnings or information as a result of processing the operation. The Appointment resource will have an updated `status` of \"busy-tentative\" if the hold is approved or  \"busy-unavailable\" if the hold is rejected."
* parameter[=].type = #Parameters