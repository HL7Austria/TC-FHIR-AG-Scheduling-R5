#### Search parameters

##### Required parameters

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
      <td markdown="span">[actor](https://www.hl7.org/fhir/appointment-search.html#Appointment-actor)</td>
      <td markdown="span">[reference](https://hl7.org/fhir/R5/search.html#reference)</td>
      <td markdown="span">Any one of the individuals participating in the appointment</td>
      <td markdown="span">Appointment.participant.actor<br>
      (
        <a href="https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-practitioner.html">HL7® AT Core Practitioner</a>, 
        <a href="https://www.hl7.org/fhir/group.html">Group</a>, 
        <a href="https://www.hl7.org/fhir/careteam.html">CareTeam</a>, <a href="https://www.hl7.org/fhir/device.html">Device</a>, 
        <a href="https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-patient.html">HL7® AT Core Patient</a>, 
        <a href="https://www.hl7.org/fhir/healthcareservice.html">HealthcareService</a>, 
        <a href="https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/StructureDefinition-at-core-practitionerRole.html">HL7® AT Core PractitionerRole</a>, 
        <a href="https://www.hl7.org/fhir/relatedperson.html">RelatedPerson</a>, 
        <a href="https://www.hl7.org/fhir/location.html">Location</a>
        )
      </td>
      <td markdown="span"></td>
    </tr>

    <tr>
        <td>
          <a name="sp-date"> </a>
          <a href="https://www.hl7.org/fhir/search.html#clinical-date">date</a>
        </td>
        <td>
          <a href="https://www.hl7.org/fhir/search.html#date">date</a>
        </td>
        <td>
          Appointment date/time.
        </td>
        <td>
          (start | requestedPeriod.start).first()
        </td>
        <td>
          <a href="https://www.hl7.org/fhir/searchparameter-registry.html#clinical-date">27 Resources</a>
        </td>
    </tr>

  </tbody>
</table>


##### Optional parameters
The following search parameters SHOULD be supported by scheduling servers:

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
      <td><a name="sp-status"> </a><a href="https://www.hl7.org/fhir/appointment-search.html#Appointment-status">status</a></td>
      <td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
      <td>The overall status of the appointment</td>
      <td>Appointment.status</td>
      <td></td>
    
    </tr>
  </tbody>
</table>