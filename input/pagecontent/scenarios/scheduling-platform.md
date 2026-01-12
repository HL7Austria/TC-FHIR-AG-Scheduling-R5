In this scenario one Central Booking Platform acts as a central Scheduling Server aggregating data from other Scheduling Servers and/or health information systems. Requests to the Central Booking Platform are relayed to known other Scheduling Servers. The other Scheduling Servers can either be health information systems or booking platforms which in turn access the APIs of other Scheduling Servers (either via FHIR or other APIs) in a cascading fashion. The Central Booking Platform aggregates search results from multiple sources for the Scheduling Client and relays requests related to appointment booking from the Scheduling Client to the target Scheduling Server. The Central Booking Platform is not required to persist scheduling related data, but can do so (e.g. for performance reasons).

<figure><img src="scenarios/scheduling-platform.svg"></figure>
<figure><img src="scenarios/sequence-platform.svg"></figure>

#### Booking with external provider

In some cases, a provider of a Scheduling Server might want a user to directly book with his scheduling client instead of via the central platform. In this case, the initial Scheduling Client redirects the user to the Scheduling Client of the provider of the corresponding Scheduling Server.

<figure><img src="scenarios/sequence-platform-external.svg"></figure>
