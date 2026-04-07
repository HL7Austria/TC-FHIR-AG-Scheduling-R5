<figure><img src="interactions/find-schedules.svg"></figure>

After (optional) selection of a HealthcareService a Scheduling Client can fetch available Schedules. The schedule resource provides a container for (time)-slots that can be booked using an appointment. One schedule applies to one service or resource that can be booked and contains multiple slots indicating the availability of this service/resource. A real-world analogue of a schedule is a calendar column (for a single resource or service). For a more detailed description, refer to [Schedule](https://www.hl7.org/fhir/schedule.html). [Search parameters](StructureDefinition-at-scheduling-schedule.html#search-parameters) of the [HL7® AT Scheduling Schedule Profile](StructureDefinition-at-scheduling-schedule.html) can be used to filter the results. If no search filter for the `active` attribute is provided, the Scheduling Server SHALL respond with resources where the value of the `active` attribute is `true` or not present.

Example URL for filtering Schedules by `service-type`, `actor` with identifier and `date`:
```
https://example.com/R5/Schedule?service-type-reference=http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType|65&actor=urn:oid:1.2.40.0.10.1.4.3.2|987654321&date=eq2026-04-07
```