#### Overview of relevant Ressources and Profiles
The following diagram shows how the Ressources and Profiles relevant to this Implementation Guide are related to each other.
```mermaid
flowchart LR
  %% Core scheduling backbone
  Schedule["**Schedule**<br/><a href='/StructureDefinition-at-scheduling-schedule.html'>HL7® AT Scheduling Schedule Profile</a>"]:::sched
  Slot["**Slot**<br/><a href='/StructureDefinition-at-scheduling-slot.html'>HL7® AT Scheduling Slot Profile</a>"]:::slot
  Appointment["**Appointment**<br/><a href='/StructureDefinition-at-scheduling-appointment.html'>HL7® AT Scheduling Appointment Profile</a>"]:::appt

  %% Service + participants
  HealthcareService["**HealthcareService**<br/><a href='/StructureDefinition-at-scheduling-healthcareService.html'>HL7® AT Scheduling HealthcareService Profile</a>"]:::svc

  Patient["**Patient**<br/><a href='https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-patient.html'>HL7® AT Core Patient Profile</a>"]:::core
  RelatedPerson["**RelatedPerson**<br/><a href='https://hl7.org/fhir/relatedperson.html'>FHIR R5 RelatedPerson</a>"]:::core
  Practitioner["**Practitioner**<br/><a href='https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-practitioner.html'>HL7® AT Core Practitioner Profile</a>"]:::core
  PractitionerRole["**PractitionerRole**<br/><a href='https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-practitionerRole.html'>HL7® AT Core PractitionerRole Profile</a>"]:::core
  Organization["**Organization**<br/><a href='https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-organization.html'>HL7® AT Core Organization Profile</a>"]:::core
  Location["**Location**<br/><a href='https://fhir.hl7.at/r5-core-main/StructureDefinition-at-core-location.html'>HL7® AT Core Location Profile</a>"]:::core

  %% Relationships Schedule/Slot/Appointment
  Schedule -->|"defines availability for"| Slot
  Slot -->|"is booked by"| Appointment
  Schedule -. "serviceType<br/>CodeableReference(HealthcareService)" .-> HealthcareService
  Schedule -. "actor<br/>Reference(Patient)" .-> Patient
  Schedule -. "actor<br/>Reference(Practitioner)" .-> Practitioner
  Schedule -. "actor<br/>Reference(PractitionerRole)" .-> PractitionerRole
  Schedule -. "actor<br/>Reference(RelatedPerson)" .-> RelatedPerson
  Schedule -. "actor<br/>Reference(HealthcareService)" .-> HealthcareService
  Schedule -. "actor<br/>Reference(Location)" .-> Location

  %% Relationships Appointment -> participants
  Appointment -->|"subject<br/>Reference(Patient|Group)"| Patient
  Appointment -. "participant.actor<br/>Reference(Patient)" .-> Patient
  Appointment -. "participant.actor<br/>Reference(RelatedPerson)" .-> RelatedPerson
  Appointment -. "participant.actor<br/>Reference(Practitioner)" .-> Practitioner
  Appointment -. "participant.actor<br/>Reference(PractitionerRole)" .-> PractitionerRole
  Appointment -. "participant.actor<br/>Reference(HealthcareService)" .-> HealthcareService
  Appointment -. "participant.actor<br/>Reference(Location)" .-> Location

  Appointment -. "serviceType<br/>CodeableReference(HealthcareService)" .-> HealthcareService
  Appointment -. "slot<br/>Reference(Slot)" .-> Slot

  %% PractitionerRole context
  PractitionerRole -->|"practitioner"| Practitioner
  PractitionerRole -->|"organization"| Organization
  PractitionerRole -. "healthcareService" .-> HealthcareService

  %% Location context
  Location -->|"managingOrganization"| Organization

 %% Styles
  classDef sched fill:#e1f5fe
  classDef slot fill:#f3e5f5
  classDef appt fill:#e8f5e8
  classDef svc fill:#fff3e0
  classDef core fill:#f5f5f5


````

| Resource          | Description                                                                      |
| ----------------- | -------------------------------------------------------------------------------- |
| Schedule          | A container for slots of time that may be available for booking appointments.   |
| Slot              | A slot of time on a schedule that may be available for booking appointments.    |
| Appointment       | 	A booking of a healthcare event among patient(s), practitioner(s) and/or related person(s) for a specific date/time.  |
| HealthcareService | Details of services available, referenced by schedules and appointments.        |
| Patient           | Subject of care receiving the appointment.                                      |
| RelatedPerson     | Person involved in patient's care (e.g., guardian).                             |
| Practitioner      | Healthcare professional participating in scheduling.                            |
| PractitionerRole  | Role of practitioner within an organization for services.                       |
| Organization      | Entity managing practitioners, locations, or services.                          |
| Location          | Physical site for services and appointments.                                    |

#### Paging
Due to the potentially large amount of data, paging SHALL be used for all interactions with HTTP method `GET`. For the correct usage of paging see [official documentation](https://hl7.org/fhir/R5/http.html#paging).

#### Messages
In typical appointment booking systems appointment-related messages are sent via various channels (e.g. email, text message). Because this implementation guide allows chaining multiple Scheduling Servers cascadingly, the necessity arises to coordinate which Scheduling Server is responsible for sending those messages. By default the Scheduling Server, that also persists Appointments, SHOULD be the one that also sends the Appointment-related messages. However, service providers of Scheduling Servers MAY also have different bilateral arrangements, which are managed outside of the scope of this implementation guide.

Note: The actual transmission of notifications or reminders to Patients (e.g., sending SMS or emails) is out of scope of this implementation guide.

#### Usage of logical IDs vs. Identifiers

When referencing resources across systems, implementers should prefer identifiers over logical IDs. Logical IDs (the ```Resource.id``` element) are unique only within a single FHIR server and may change if the resource is copied or migrated. In contrast, identifiers (```Resource.identifier```) are stable values designed for use across different systems and contexts (e.g. social insurance number). Using identifiers promotes interoperability, ensuring consistent and reliable linkage of data between independent FHIR implementations.

#### HTTP return preference
Scheduling Clients SHALL use the following HTTP return preference for requests of standard `POST` and `PUT` interactions:

```Prefer: return=representation```

Scheduling Servers SHALL respond to `POST` and `PUT` requests of standard interactions with the full resource in the response body as described [here](https://www.hl7.org/fhir/http.html#ops).
