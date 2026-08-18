Instance: HL7ATSchedulingSlotExample01-free
InstanceOf: HL7ATSchedulingSlot
Usage: #example
Description: "A simple Slot that is available for Booking"
* schedule = Reference(Schedule/HL7ATSchedulingScheduleExample01)
* status = #free
* start = "2025-09-15T08:00:00Z"
* end = "2025-09-15T09:00:00Z"

* serviceType.concept.coding.system = "http://terminology.hl7.org/CodeSystem/service-type"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"

* extension[0].url = "https://fhir.hl7.at/tc/wg/scheduling/r5/StructureDefinition/slot-encounter-class"
* extension[0].valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* extension[0].valueCodeableConcept.coding[0].code = #AMB
* extension[0].valueCodeableConcept.coding[0].display = "ambulatory"