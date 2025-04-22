#### Search parameters

##### Required Parameters

At least one of the parameters [actor](https://www.hl7.org/fhir/schedule-search.html#Schedule-actor) or [service-type-reference](https://www.hl7.org/fhir/schedule-search.html#Schedule-service-type-reference) is required. Additionally [date](https://www.hl7.org/fhir/schedule-search.html#Schedule-date) is always required.

<table>
  <thead>
    <tr class="header">
      <th>Name</th>
      <th>Type</th>
      <th>Description</th>
      <th>Expression</th>
      <th>In Common</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td markdown="span">[actor](https://www.hl7.org/fhir/schedule-search.html#Schedule-actor)</td>
      <td markdown="span">[reference](https://www.hl7.org/fhir/search.html#reference)</td>
      <td markdown="span">The individual(HealthcareService, Practitioner, Location, ...) to find a Schedule for **AND/OR service-type-reference required</td>
      <td markdown="span">Schedule.actor ([Practitioner](https://www.hl7.org/fhir/practitioner.html), [Practitioner Role]())</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[date](https://www.hl7.org/fhir/schedule-search.html#Schedule-date)</td>
      <td markdown="span">[date](https://www.hl7.org/fhir/search.html#date)</td>
      <td markdown="span">Search for Schedule resources that have a period that contains this date specified</td>
      <td markdown="span">Schedule.planningHorizon</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[service-type-reference](https://www.hl7.org/fhir/schedule-search.html#Schedule-service-type-reference)</td>
      <td markdown="span">[reference](https://www.hl7.org/fhir/search.html#reference)</td>
      <td markdown="span">The type (by HealthcareService) of appointments that can be booked into associated slot(s) **AND/OR actor required**</td>
      <td markdown="span">Schedule.serviceType.reference</td>
      <td markdown="span"></td>
    </tr>
  </tbody>
</table>
