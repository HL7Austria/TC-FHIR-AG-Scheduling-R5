Instance: HL7ATSchedulingSlotExample02-VirtualVisit
InstanceOf: HL7ATSchedulingSlot
Usage: #example
Description: "A free Slot for booking an Appointment that can only be conducted as a virtual visit (e.g. video call)"
* schedule = Reference(Schedule/HL7ATSchedulingScheduleExample01)
* status = #free
* start = "2025-09-15T08:00:00Z"
* end = "2025-09-15T09:00:00Z"

* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"

* extension[0].url = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/slot-encounter-class"
* extension[0].valueCodeableConcept.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* extension[0].valueCodeableConcept.coding[0].code = #VR
* extension[0].valueCodeableConcept.coding[0].display = "virtual"