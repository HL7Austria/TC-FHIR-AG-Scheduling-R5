<figure><img src="interactions/hold-slot.svg"></figure>
In this optional step, a [Slot](StructureDefinition-at-scheduling-slot.html) can be requested to be put on hold (i.e. reserved) by a Scheduling Client until the Appointment is booked. [$hold](OperationDefinition-slot-hold.html) is the corresponding operation definition. The Slot is identified either by a Reference or one or more Identifiers, which have to identify a single slot instance. The response contains the Slot resource and an OperationOutcome. In case of success, the `status` of the Slot is set to "busy-tentative". If the hold operation is rejected, the `status` of the Slot is set to "busy-unavailable".

ToDo: Discuss the duration for which a slot is held and whether this should be contained in the response.
