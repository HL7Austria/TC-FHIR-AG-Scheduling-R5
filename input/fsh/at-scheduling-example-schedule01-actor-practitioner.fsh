Instance: HL7ATSchedulingScheduleExample01
InstanceOf: HL7ATSchedulingSchedule
Description: "Schedule with Practitioner"
Usage: #example
* active = true
* serviceType.concept.coding.system = "http://terminology.hl7.org/CodeSystem/service-type"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* actor[0] = Reference(Practitioner/HL7ATCorePractitionerExample01) "Melanie Musterärztin"