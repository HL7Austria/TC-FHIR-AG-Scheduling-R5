
<h4> Book a New Appointment </h4>
This operation is used by the Scheduling Client to request the booking of an appointment from a Scheduling Server. The Scheduling Client provides a full Appointment resource that SHALL have the status ```proposed```.

If the appointment ```$book``` operation was successful the Scheduling Server returns an Appointment resource with the the value of ```Appointment.status``` set to ```booked```. If the Appointment needs to be manually confirmed, the Scheduling Server ```Appointment.status``` of the returned Appointment is set to ```pending```.

The Scheduling Client is expected to convey the outcome to the user who requested the creation of the appointment, and to record the current state of the appointment in the corresponding system(s), including any error conditions..

<h5> Pre-Conditions </h5>
The following pre-conditions must be fullfilled for the $book operation to be successful:
- The referenced patient in ```Appointment.subject``` SHALL already exist on or must be known to the Scheduling Server
- If a HealthcareService is provided in ```Appointment.serviceType``` it SHALL already exist on or must be known to and supported by the Scheduling Server
- If a Slot is provided in ```Appointment.slot``` the Slot SHALL exist and must be available for booking on the Scheduling Server

If any of those pre-conditions are not met, the Scheduling Server SHALL reject the operation and provide a corresponding explanation in the OperationOutcome.

<h5> Examples </h5>
ToDo