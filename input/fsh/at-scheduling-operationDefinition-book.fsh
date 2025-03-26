/*##############################################################################
# Type:       FSH-File for a FHIR® OperationDefinition
# About:      HL7® Austria FHIR® Scheduling Operation $book.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Instance: appointment-book
InstanceOf: OperationDefinition
Usage: #definition

* name = "Book_Appointment_Operation"
* status = #active
* kind = #operation
* description = "Request to book a selected Appointment. This operation follows the appointment availability and optional hold interactions. This operation completes the booking of an appointment. The server determines if the nominated appointment is still available (i.e., all the required actors and physical assets needed for the appointment are still available) and either accepts or rejects the book request and updates the resource status accordingly. "
* affectsState = true
* code = #book
* resource = #Appointment
* system = false
* type = true
* instance = false
* parameter[0].name = #appointment-resource
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The full appointment resource is needed for this operation. The appointment SHALL have the status ```proposed```."
* parameter[=].type = #Resource
* parameter[=].targetProfile = Canonical(HL7ATSchedulingAppointment)
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The response will be a Parameters resource consisting of the requested Appointment resource and an OperationOutcome with errors, warnings or information as a result of processing the operation. The Appointment resource will have an updated `status` of ```booked``` if the request is approved, ```pending``` if it needs to be manually confirmed or  ```cancelled``` if it is rejected."
* parameter[=].type = #Parameters