Instance: HL7ATSchedulingScheduleExample01
InstanceOf: HL7ATSchedulingSchedule
Description: "Schedule with Practitioner"
Usage: #example
* active = true
* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* actor[0] = Reference(Practitioner/HL7ATCorePractitionerExample01) "Melanie Musterärztin"