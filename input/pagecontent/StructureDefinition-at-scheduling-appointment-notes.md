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
      <td markdown="span">Appointment.participant.actor<br>(<a href="practitioner.html">Practitioner</a>, <a href="group.html">Group</a>, <a href="careteam.html">CareTeam</a>, <a href="device.html">Device</a>, <a href="patient.html">Patient</a>, <a href="healthcareservice.html">HealthcareService</a>, <a href="practitionerrole.html">PractitionerRole</a>, <a href="relatedperson.html">RelatedPerson</a>, <a href="location.html">Location</a>)</td>
      <td markdown="span"></td>
    </tr>

    <tr>
        <td><a name="sp-date"> </a><a href="appointment-search.html#clinical-date">date</a></td>
        <td><a href="search.html#date">date</a></td>
        <td>Appointment date/time.</td>
        <td>(start | requestedPeriod.start).first()</td>
        <td><a href="searchparameter-registry.html#clinical-date">27 Resources</a></td>
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
      <td><a name="sp-status"> </a><a href="appointment-search.html#Appointment-status">status</a></td>
      <td><a href="search.html#token">token</a></td>
      <td>The overall status of the appointment</td>
      <td>Appointment.status</td>
      <td></td>
    
    </tr>
  </tbody>
</table>