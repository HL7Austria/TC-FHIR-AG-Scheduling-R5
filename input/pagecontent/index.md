### Management Summary

The Austrian Appointment Scheduling Implementation Guide (IG) defines a standardized, FHIR®-based approach for online appointment booking across the Austrian healthcare system. It enables software vendors and healthcare providers to implement interoperable scheduling solutions — ranging from a single practice that offers direct online booking to a [central scheduling platform](use-case-central-scheduling-platform.html) that aggregates availability from many systems.

Building on the FHIR R5 [Schedule](https://www.hl7.org/fhir/schedule.html) and [Slot](https://www.hl7.org/fhir/slot.html) resources and adding operations for discovering healthcare service providers and for temporarily reserving bookable slots, the guide covers the full scheduling lifecycle: finding healthcare services and providers, locating available slots, holding and booking appointments, and managing cancellations, postponements and updates. It also supports virtual appointments such as video consultations.

By providing a common reference for these interactions, the guide fosters interoperability and a consistent patient experience across Austrian healthcare systems. Software vendors can use it to verify whether their use cases are sufficiently supported and to align their implementations with a shared, nationally coordinated framework.

### Workgroup

HL7® Austria is an official Affiliate of HL7® International. Within HL7® Austria the technical committee for FHIR® (TC FHIR®) is responsible to promote and disseminate the new upcoming standard HL7® FHIR®. The TC FHIR® deals with the standard-compliant and coordinated usage of HL7® FHIR® based communication solutions. It coordinates and describes necessary localizations and offers concrete help for FHIR®-compliant interfaces.

This implementation guide is developed and maintained on [GitHub](https://github.com/HL7Austria/TC-FHIR-AG-Scheduling-R5).

### Contact

For questions and feedback regarding this implementation guide, please contact <tc-fhir@hl7.at>.
