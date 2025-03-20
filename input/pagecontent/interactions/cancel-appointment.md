<figure><img src="interactions/cancel-appointment-client.svg"></figure>
To cancel an Appointment, the Scheduling Client sends an [HL7® AT Scheduling Appointment Profile](StructureDefinition-at-scheduling-appointment.html) with its `status` set to "cancelled" or "entered-in-error". The Scheduling Server responds with the Appointment resource or an OperationOutcome in case of error. The Scheduling Server is responsible for notifying the participants of the Appointment.

ToDo: Do we need server-side cancellation?

<figure><img src="interactions/cancel-appointment-server.svg"></figure>
