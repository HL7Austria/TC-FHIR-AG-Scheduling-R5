
This operation is used by the Scheduling Client and Scheduling Server Actors. The Hold Slot operation is used to request that a specific appointment-slot (selected from one of the available potential slots returned with the response of a preceding query) is held by the Scheduling Server, until the appointment is booked, cancelled, or the hold on the slot is released or expires.

The Scheduling Server is expected to hold the necessary time slots and resources for the potential appointment to take place at the given time and for the given duration.

Note that it is possible that between the time the Find Potential Appointments response was received, and the time the Hold Slot request is issued, the requested slot is no longer available. In such case, the server SHALL respond with an OperationOutcome that describes the issue.

<h4> Examples </h4>
<h5> Request Hold </h5>
{% include examples/Slot-operationHold-request.md %}

Response to the hold request:

{% include examples/Slot-operationHold-response.md %}

<h5> Release Hold </h5>
{% include examples/Slot-operationHoldRelease-request.md %}

Response to the hold release request:

{% include examples/Slot-operationHoldRelease-response.md %}
