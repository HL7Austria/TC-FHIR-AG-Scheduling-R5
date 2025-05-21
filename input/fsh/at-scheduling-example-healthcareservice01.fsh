Alias: $AtSchedulingServiceType = http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType

Instance: HL7ATSchedulingHealthcareServiceExample01
InstanceOf: HealthcareService
Usage: #example
* meta.profile = "http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-healthcareservice"
* active = true
* providedBy = Reference(Organization/HL7ATCoreOrganizationExample01) "Amadeus Spital"
* name = "Allgemeinmedizinische Versorgung"
* type = $AtSchedulingServiceType#65 "Physiotherapy"
* type.text = "Allgemeinmedizin"