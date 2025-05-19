Instance: HL7ATSchedulingScheduleExample03
InstanceOf: HL7ATSchedulingSchedule
Description: "Schedule with HealthcareService"
Usage: #example
* active = true
* serviceType.concept.coding.system = "http://terminology.hl7.org/CodeSystem/service-type"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* actor[0] = Reference(HealthcareService/HL7ATSchedulingHealthcareServiceExample01) "Example of healthcareservice"