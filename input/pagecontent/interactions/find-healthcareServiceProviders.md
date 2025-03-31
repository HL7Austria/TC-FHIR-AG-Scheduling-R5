<figure><img src="interactions/find-healthcareService-Providers.svg"></figure>

Depending on the scheduling scenario that is implementented ("peer-to-peer" appointment booking, availability of a central platform for scheduling, ...), it might be necessary not only to find healthcare services that are offerd but also to find out which medical institution is offering them. Additionally, finding healthcare service providers that offer a service close to a location or within a certain zip-code area might be useful as well.

For such a purpose, this IG provides a new operation called [$findHSP](OperationDefinition-healthcareService-provider-find.html) (find Healthcare Service Provider).

This operation uses either a full HealthCareService resource as input parameter or dedicated codes for it like ```HealthcareService.category```, ```HealthcareService.type``` or ```HealthcareService.specialty```.

In addition to that a Scheduling Client can provide further filter criteria in its search like:
- a region where a healthcare service should ideally be offered with either a Location reference or a zip code
- the desired availablity time of a healthcare service

The response will be a Bundle consisting of the HealthcareService resource and a list of healthcare service providers (Organization, Practitioner, PractitionerRole) that offer the requested service.
