#### Search parameters

##### Required Parameters

At least one of the following search parameters is required:

| Name              | Type      | Description                                                                                     | Expression                                      | In Common |
|-------------------|-----------|-------------------------------------------------------------------------------------------------|-------------------------------------------------|-----------|
|  [location](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-location)         | [reference](https://www.hl7.org/fhir/search.html#reference) | The location of the Healthcare Service | HealthcareService.location (Location)           |           |
|  [organization](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-organization)     | [reference](https://www.hl7.org/fhir/search.html#reference) | The organization that provides this Healthcare Service                                          | HealthcareService.providedBy (Organization)     |           |
|  [service-category](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-service-category) | [token](https://www.hl7.org/fhir/search.html#token) | Service Category of the Healthcare Service                                                      | HealthcareService.category                      |           |
|  [service-type](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-service-type)     | [token](https://www.hl7.org/fhir/search.html#token) | The type of service provided by this healthcare service                                         | HealthcareService.type                          |           |
|  [specialty](https://www.hl7.org/fhir/healthcareservice-search.html#HealthcareService-specialty)        | [token](https://www.hl7.org/fhir/search.html#token) | The specialty of the service provided by this healthcare service                                | HealthcareService.specialty                     |           |


##### Optional Parameters
The following search parameters SHOULD be supported by scheduling servers:


| Name              | Type      | Description                                                                                     | Expression                                      | In Common |
|-------------------|-----------|-------------------------------------------------------------------------------------------------|-------------------------------------------------|-----------|
|  [characteristic](https://hl7.org/fhir/healthcareservice-search.html#HealthcareService-characteristic)   | [token](https://www.hl7.org/fhir/search.html#token)      | One of the HealthcareService's characteristics                                                  | HealthcareService.characteristic                |           |
|  [communication](https://build.fhir.org/healthcareservice-search.html#HealthcareService-communication)    | [token](https://www.hl7.org/fhir/search.html#token)      | Languages that are available at this service                                                    | HealthcareService.communication                 |           |
|  [coverage-area](https://build.fhir.org/healthcareservice-search.html#HealthcareService-coverage-area)    | [reference](https://www.hl7.org/fhir/search.html#reference)  | Location(s) service is intended for/available to                                                | HealthcareService.coverageArea (Location)       |           |
