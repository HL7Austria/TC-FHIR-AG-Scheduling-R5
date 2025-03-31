#### Search parameters

##### Required Parameters

At least one of the following search parameters is required:

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
      <td markdown="span">[location](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-location)</td>
      <td markdown="span">[reference](https://www.hl7.org/fhir/search.html#reference)</td>
      <td markdown="span">The location of the Healthcare Service</td>
      <td markdown="span">HealthcareService.location (Location)</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[organization](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-organization)</td>
      <td markdown="span">[reference](https://www.hl7.org/fhir/search.html#reference)</td>
      <td markdown="span">The organization that provides this Healthcare Service</td>
      <td markdown="span">HealthcareService.providedBy (Organization)</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[service-category](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-service-category)</td>
      <td markdown="span">[token](https://www.hl7.org/fhir/search.html#token)</td>
      <td markdown="span">Service Category of the Healthcare Service</td>
      <td markdown="span">HealthcareService.category</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[service-type](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-service-type)</td>
      <td markdown="span">[token](https://www.hl7.org/fhir/search.html#token)</td>
      <td markdown="span">The type of service provided by this healthcare service</td>
      <td markdown="span">HealthcareService.type</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[specialty](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-specialty)</td>
      <td markdown="span">[token](https://www.hl7.org/fhir/search.html#token)</td>
      <td markdown="span">The specialty of the service provided by this healthcare service</td>
      <td markdown="span">HealthcareService.specialty</td>
      <td markdown="span"></td>
    </tr>
  </tbody>
</table>

##### Optional Parameters

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
      <td markdown="span">[characteristic](https://hl7.org/fhir/healthcareservice-search.html#HealthcareService-characteristic)</td>
      <td markdown="span">[token](https://www.hl7.org/fhir/search.html#token)</td>
      <td markdown="span">One of the HealthcareService's characteristics</td>
      <td markdown="span">HealthcareService.characteristic</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[communication](https://build.fhir.org/healthcareservice-search.html#HealthcareService-communication)</td>
      <td markdown="span">[token](https://www.hl7.org/fhir/search.html#token)</td>
      <td markdown="span">Languages that are available at this service</td>
      <td markdown="span">HealthcareService.communication</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[coverage-area](https://build.fhir.org/healthcareservice-search.html#HealthcareService-coverage-area)</td>
      <td markdown="span">[reference](https://www.hl7.org/fhir/search.html#reference)</td>
      <td markdown="span">Location(s) service is intended for/available to</td>
      <td markdown="span">HealthcareService.coverageArea (Location)</td>
      <td markdown="span"></td>
    </tr>
  </tbody>
</table>
