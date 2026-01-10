
- For input parameters that are codes, the simple FHIR [token](https://hl7.org/fhir/R5/search.html#token) search parameter type is used instead of the complex ```CodeableConcept``` datatype. This allows either the 'GET' or the 'POST' syntax to be used to initiate the interaction in many cases. The ```Reference``` datatype is used for resources references, which allows the requester to use either a reference to an existing resource, or an identifier ([logical reference](https://hl7.org/fhir/R5/references-definitions.html#Reference.identifier)).
- To set the upper limit on the total number of results to return, use the standard [```_count```](https://hl7.org/fhir/R5/search.html#count) search parameter.

<h4> For the Scheduling Client </h4>
This query operation is used by the Scheduling Client to find healthcare service providers that offer a specific healthcare service. This can be achieved by:
- using a HealthcareService instance (as full resource) as search input
- identifying the healthcare service via a code (```HealthcareService.category```, ```HealthcareService.type``` or ```HealthcareService.specialty```) 

In addition to that a Scheduling Client can provide further filter criteria in its search like:
- a region where a healthcare service should ideally be offered with either a Location reference or a zip code
- the desired availablity time of a healthcare service

<h5> Pre-Conditions </h5>
The following pre-conditions must be fulfilled for the ```$findHSP``` operation to be successful:
- The general information about the HealthcareService identification itself is already available in advance
- This means that either the client has already searched for the healthcare service and has fetched the corresponding HealthcareService resource instance or the client is aware of the codes for category, type or specialty of it.

If a healthcare service information is not provided by the client in this query operation, the Scheduling Server SHALL reject the operation and provide a corresponding explanation in the OperationOutcome.

<h4> For the Scheduling Server </h4>
Based on the search input the Scheduling Server has to look up the corresponding healthcare service as well as the healthcare service providers that offer it. Depending on the implementation and the supported scenarios for the scheduling workflow, the server has to do this internally and/or with its connected systems.
It SHALL respond to the client with a Bundle containing the HealthcareService resource and a list of healthcare service providers (Organization, Practitioner, PractitionerRole) that offer the requested service. Furthermore it SHALL contain an OperationOutcome with errors, warnings or information as a result of processing the operation.

<h4> Examples </h4>
<h5> Search for healthcare service provider via service type</h5>
furthermore, the district and the availability were added as search criteria

{% include examples/HealthcareService-operationFindHCP-request.md %}

Response to the search request:

{% include examples/HealthcareService-operationFindHCP-response.md %}