#### Cancellation by Scheduling Client
<figure><img src="interactions/cancel-appointment-client.svg"></figure>
To cancel an Appointment, the Scheduling Client sends an [HL7® AT Scheduling Appointment Profile](StructureDefinition-at-scheduling-appointment.html) with its ```status``` set to ```cancelled``` or ```entered-in-error```. The Scheduling Server responds with the Appointment resource or an OperationOutcome in case of error. If the Appointments was successfully cancelles, the status of the Slot is set to free, ```Slot.status=free```.

#### Cancellation by Scheduling Server
<figure><img src="interactions/cancel-appointment-server.svg"></figure>
When an Appointment is cancelled on the Scheduling Server it's status is set to ```cancelled```. The Scheduling Server is responsible for notifying participants of the Appointment (e.g. via email, text message or push notification) about the cancellation. Scheduling Clients then can fetch the updated Appointment (see [Find existing Appointments](interactions.html#find-existing-appointments)). If the Appointments was successfully cancelles, the status of the Slot is set to free, ```Slot.status=free```.
