**ToDo: Define restrictions on which fields can be updated.**

#### Update by Scheduling Client
<figure><img src="interactions/update-appointment-information-client.svg"></figure>
To update an Appointment, a Scheduling Client sends a [HL7® AT Scheduling Appointment Profile](StructureDefinition-at-scheduling-appointment.html) resource with updated attributes. The Scheduling Client SHALL NOT change the participant Patient of the Appointment. The Scheduling Server then returns the updated Appointment or an OperationOutcome in case of error. The Scheduling Server responds with the Appointment resource or an OperationOutcome in case of error.

#### Update by Scheduling Server
<figure><img src="interactions/update-appointment-information-server.svg"></figure>
When an Appointment's information is updated on the Scheduling Server, the values **ToDo list allowed attributes** are updated. The Scheduling Server is responsible for notifying participants of the Appointment (e.g. via email, text message or push notification) about the update, if the changed information requires informing them. Scheduling Clients then can fetch the updated Appointment (see [Find existing Appointments](interactions.html#find-existing-appointments)).