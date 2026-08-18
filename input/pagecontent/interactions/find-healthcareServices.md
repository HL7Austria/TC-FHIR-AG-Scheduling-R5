<figure><img src="interactions/find-healthcareServices.svg"></figure>

A Scheduling Client can fetch bookable HealthcareServices from a Scheduling Server. [Search parameters](StructureDefinition-at-scheduling-healthcareservice.html#search-parameters) of the [HL7® AT Scheduling HealthcareService Profile](StructureDefinition-at-scheduling-healthcareservice.html) can be used to filter the results. If no search filter for the `active` attribute is provided, the Scheduling Server SHALL respond with resources where the value of the `active` attribute is `true` or not present.

Example URL for filtering HealthcareServices by `service-type`:
```
https://example.com/R5/HealthcareService?service-type=http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType|65
```