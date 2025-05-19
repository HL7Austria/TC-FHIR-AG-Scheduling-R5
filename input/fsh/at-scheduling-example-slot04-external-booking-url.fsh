Instance: HL7ATSchedulingSlotExample04-external-booking-URL
InstanceOf: HL7ATSchedulingSlot
Usage: #example
Description: "A simple Slot that is available for booking and has an external booking URL"
* schedule = Reference(Schedule/HL7ATSchedulingScheduleExample01)
* status = #free
* start = "2025-09-15T08:00:00Z"
* end = "2025-09-15T09:00:00Z"

* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"

* extension[0].url = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/slot-encounter-class"
* extension[0].valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* extension[0].valueCodeableConcept.coding[0].code = #AMB
* extension[0].valueCodeableConcept.coding[0].display = "ambulatory"

* extension[1].url = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/appointment-booking-url"
* extension[1].valueUri = "https://booking.example.com/slot/297c0007-f8d1-4e47-bddb-a47978607f65"
