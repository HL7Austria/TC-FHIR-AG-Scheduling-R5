Instance: HL7ATSchedulingScheduleExample02
InstanceOf: HL7ATSchedulingSchedule
Description: "Schedule with PractitionerRole"
Usage: #example
* active = true
* serviceType.concept.coding.system = "http://terminology.hl7.org/CodeSystem/service-type"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* actor[0] = Reference(PractitionerRole/HL7ATCorePractitionerRoleExample01) "PractitionerRole HL7ATCorePractitionerRoleExample01"