/*##############################################################################
# Type:       FSH-File for a FHIR® OperationDefinition
# About:      HL7® Austria FHIR® Scheduling Operation $hold.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Instance: appointment-hold
InstanceOf: OperationDefinition
Usage: #definition

* name = "Hold_Appointment_Operation"
* status = #active
* kind = #operation
* description = "Request for a hold on a selected Appointment in order for the user to complete entering data for booking an appointment.  This operation precedes the booking and follows the appointment availability interaction.  The server determines if the nominated appointment is still available (i.e., all the required actors and physical assets needed for the appointment are still available) and either accepts or rejects the hold request and updates the resource status accordingly. "
* code = #hold
* resource = #Appointment
* system = false
* type = true
* instance = false
* parameter[0].name = #appointment-reference
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A resource id for one of proposed Appointments returned by a prior $find operation (e.g., Resource/1234).  References can be to an absolute URL, but servers only perform this operation on their own appointments."
* parameter[=].type = #Reference
* parameter[=].targetProfile = Canonical(HL7ATSchedulingAppointment)
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The response will be a Parameters resource consisting of the requested held Appointment resource and an OperationOutcome with errors, warnings or information as a result of processing the operation. The Appointment resource will have an updated `status` of \"pending\" if the hold is approved or  \"cancelled\" if the hold is rejected."
* parameter[=].type = #Parameters