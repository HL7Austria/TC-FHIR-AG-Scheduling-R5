#### Overview of relevant Ressources and Profiles
The following diagram shows how the Ressources and Profiles relevant to this Implementation Guide are related to each other.
```mermaid
{% include images/interactions/relationships-diagram.mermaid %
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

#### HTTP return preference
Scheduling Clients SHALL use the following HTTP return preference for requests of standard `POST` and `PUT` interactions:

```Prefer: return=representation```

Scheduling Servers SHALL respond to `POST` and `PUT` requests of standard interactions with the full resource in the response body as described [here](https://www.hl7.org/fhir/http.html#ops).
