#### Postponement by Scheduling Client
<figure><img src="interactions/postpone-appointment-client.svg"></figure>
To postpone an Appointment, the Scheduling Client sends an [HL7® AT Scheduling Appointment](StructureDefinition-at-scheduling-appointment.html) with updated values for ```start```, ```end``` and optionally ```minutesDuration```. The Scheduling Server then returns the updated Appointment or an OperationOutcome in case of error. The Scheduling Server responds with the Appointment resource or an OperationOutcome in case of error.

#### Postponement by Scheduling Server
<figure><img src="interactions/postpone-appointment-server.svg"></figure>
When an Appointment is postponed on the Scheduling Server, the values for ```start```, ```end``` and optionally ```minutesDuration``` are updated. The Scheduling Server is responsible for notifying participants of the Appointment (e.g. via email, text message or push notification) about the postponement. Scheduling Clients then can fetch the updated Appointment (see [Find existing Appointments](interactions.html#find-existing-appointments)).