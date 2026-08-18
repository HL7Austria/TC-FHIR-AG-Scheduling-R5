This interaction updates the information (metadata) of an existing Appointment, such as ```description```, ```note```, ```patientInstruction```, ```priority``` or the non-Patient participants. The following SHALL NOT be changed via this interaction:

- the participant Patient (```participant[HL7ATCorePatient]```);
- the timing (```start```, ```end```, ```minutesDuration```, ```slot```) — use the [Postpone Appointment](interactions.html#postpone-appointment) interaction instead;
- the service (```serviceType``` and the referenced HealthcareService) — cancel the Appointment (see [Cancel Appointment](interactions.html#cancel-appointment)) and book a new one (see [Book Appointment](interactions.html#book-appointment-book)) instead.

#### Update by Scheduling Client
<figure><img src="interactions/update-appointment-information-client.svg"></figure>
The Scheduling Client sends a [HL7® AT Scheduling Appointment Profile](StructureDefinition-at-scheduling-appointment.html) resource with the updated attributes, respecting the restrictions above. The Scheduling Server responds with the updated Appointment resource or an OperationOutcome in case of error.

#### Update by Scheduling Server
<figure><img src="interactions/update-appointment-information-server.svg"></figure>
The Scheduling Server may update the same attributes, subject to the same restrictions, and is responsible for notifying participants of the Appointment (e.g. via email, text message or push notification) about the update, if the changed information requires informing them. Scheduling Clients then can fetch the updated Appointment (see [Find existing Appointments](interactions.html#find-existing-appointments)).
