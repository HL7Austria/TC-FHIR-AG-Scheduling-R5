<figure><img src="interactions/find-existing-appointments.svg"></figure>

Scheduling Clients can fetch existing Appointments from Scheduling Servers. [Search parameters](StructureDefinition-at-scheduling-appointment.html#search-parameters) of the [HL7® AT Scheduling Appointment Profile](StructureDefinition-at-scheduling-appointment.html) can be used to filter the results.

Example URL for filtering Appointments by `date` and `actor` with Austrian Social Security Number:
```
https://example.com/R5/Appointment?actor:identifier=urn:oid:1.2.40.0.10.1.4.3.1|1234010100&date=ge2026-04-07&date=le2026-04-14
```