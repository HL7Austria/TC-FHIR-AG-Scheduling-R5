<figure><img src="interactions/find-slots.svg"></figure>

After selecting one or more Schedules, available Slots for this/those Schedules can be fetched. The slot is one unit of time on a schedule and represents the smallest unit of time that the service or resource can be booked for. A real-world analogue of a slot would be the rows in a calendar column. For a more detailed description, refer to [Slot](https://www.hl7.org/fhir/slot.html). [Search parameters](StructureDefinition-at-scheduling-slot.html#search-parameters) of the [HL7® AT Scheduling Slot Profile](StructureDefinition-at-scheduling-slot.html) can be used to filter the results.

Example URL for filtering Slots by `service-type`, `actor` with identifier and `date`:
```
https://example.com/R5/Slot?schedule=Schedule/HL7ATSchedulingScheduleExample01&service-type-reference=http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType|65&date=ge2026-04-07&date=le2026-04-14
```