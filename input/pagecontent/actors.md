This IG defines two types of actors relevant to the scheduling process: Scheduling Client and Scheduling Server.

#### Scheduling Client
The [Scheduling Client](ActorDefinition-at-scheduling-actor-scheduling-client.html) issues parameterized requests to the Scheduling Server to retrieve Healthcare Service Providers, Healthcare Services, available time slots and other data relevant for appointment scheduling. It books, edits and cancels appointments for a specific patient.

#### Scheduling Server
A [Scheduling Server](ActorDefinition-at-scheduling-actor-scheduling-server.html) provides data relevant to appointment scheduling, including Healthcare Service Providers, Healthcare Services, available time slots. It offers services such as creating patients, booking, editing and cancelling appointments.