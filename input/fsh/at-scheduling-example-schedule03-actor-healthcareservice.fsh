Instance: HL7ATSchedulingScheduleExample03
InstanceOf: HL7ATSchedulingSchedule
Description: "Schedule with HealthcareService"
Usage: #example 
* active = true
* serviceType.concept.coding.system = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"
* serviceType.concept.coding.code = #65
* serviceType.concept.coding.display = "Physiotherapy"
* actor[0] = Reference(HealthcareService/HL7ATSchedulingHealthcareServiceExample01) "Example of healthcareservice"
* planningHorizon.start = "2025-05-13T08:00:00+02:00"
* planningHorizon.end = "2025-09-23T17:00:00+02:00"
