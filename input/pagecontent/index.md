### Introduction

This FHIR Implementation Guide (IG) provides a structured framework for software vendors who aim to offer online appointment booking solutions in Austria. It supports multiple booking scenarios, including the [central scheduling platform](scenarios.html#central-scheduling-platform) model and [simple appointment booking](scenarios.html#simple-appointment-booking).

It is inspired by the [ISiK Modul "Terminplanung"](https://simplifier.net/isik-terminplanung-v4/~introduction) and [IHE Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) implementation guides and leverages the FHIR Resources [Schedule](https://www.hl7.org/fhir/schedule.html) and [Slot](https://www.hl7.org/fhir/slot.html) for appointment booking. Additionally, it introduces operations for searching for healthcare service providers and for temporarily reserving bookable slots. Furthermore, this guide extends support to virtual appointments, including video call consultations, enabling healthcare providers to seamlessly integrate them into the booking process.

This version, 0.1.0 - Informative, is still in its early stage and serves as a reference point for software vendors. The goal is to help vendors verify whether their use cases are sufficiently supported within this framework, fostering interoperability and streamlined appointment scheduling processes across healthcare systems.

**Download**: You can download this implementation guide in [NPM format](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification) from [here](package.tgz).


### Dependencies
This guide is based on the <a href="{{site.data.fhir.path}}">FHIR® R5</a> specification.  In addition, this guide also relies on a number of parent implementation guides:

{% include dependency-table-short.xhtml %}

### Known Issues
In this implementation guide a ValueSet [AT Scheduling Service Type](ValueSet-AtSchedulingServiceType.html) is used in several Profiles. In the future, the ValueSet will contain an extendable set of suggested codes, but creating a single harmonized List with codes from all vendors is out of scope. This ValueSet currenctly only serves as a placeholder and contains a single entry in order to provide usefull examples for the profiles that make use of it.

Furthermore, the transmission of notifications or reminders to Patients is out of scope for this implementation guide. While notifications are mentioned in the context of cancellation workflows, the IG does not define mechanisms or channels for directly delivering messages to Patients.
 
### Governance

HL7® Austria is an official Affiliate of HL7® International. Within HL7® Austria the technical committee for FHIR® (TC FHIR®) is responsible to promote and disseminate the new upcoming standard HL7® FHIR®.
The TC FHIR® deals with the standard-compliant and coordinated usage of HL7® FHIR® based communication solutions.
It coordinates and describes necessary localizations and offers concrete help for FHIR®-compliant interfaces.

### License and Legal Terms
HL7®, HEALTH LEVEL SEVEN® and FHIR® are trademarks owned by Health Level Seven International, registered with the United States Patent and Trademark Office.

This Implementation Guide contains and references intellectual property owned by third parties (“Third Party IP”). Acceptance of these License Terms does not grant any rights with respect to Third Party IP. The licensee alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize Third Party IP in connection with the specification or otherwise.
