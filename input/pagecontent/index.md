### Introduction

This FHIR Implementation Guide (IG) provides a structured framework for software vendors that aim to offer online appointment booking solutions in Austria. It supports multiple booking scenarios, including the [central scheduling platform](scenarios.html#central-scheduling-platform) model and [simple appointment booking](scenarios.html#simple-appointment-booking).

It is inspired by the [ISiK Modul "Terminplanung"](https://simplifier.net/isik-terminplanung-v4/~introduction) and [IHE Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) implementation guides and leverages the FHIR Resources [Schedule](https://www.hl7.org/fhir/schedule.html) and [Slot](https://www.hl7.org/fhir/slot.html) for appointment booking. Additionally, it introduces operations for searching for healthcare service providers and for temporarily reserving bookable slots. Furthermore, this guide extends support to virtual appointments, including video consultations, enabling healthcare providers to seamlessly integrate them into the booking process.

This version, 0.1.0 - Informative, is still in its early stage and serves as a reference point for software vendors. The goal is to help vendors verify whether their use cases are sufficiently supported within this framework, fostering interoperability and streamlined appointment scheduling processes across healthcare systems.

**Download**: You can download this implementation guide in [NPM format](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification) from [here](package.tgz).

### Relationship to ISiK and IHE Scheduling

This guide draws on two existing scheduling specifications — the German [ISiK Modul "Terminplanung"](https://simplifier.net/guide/isik-terminplanung-stufe-5) (gematik) and [IHE Scheduling](https://profiles.ihe.net/ITI/Scheduling) (IHE ITI) — but adapts them to the Austrian context and to a cross-organizational, online booking setting. The most important differences concern how the FHIR Resources `Slot` and `Appointment` are used to discover availability, and which use cases are in scope.

#### Usage of Resources: Appointment vs. Slot

The central conceptual difference between the three guides is *which Resource a Scheduling Client browses when looking for availability*.

- **This IG (Slot-centric discovery).** Availability is exposed as `Slot` Resources. A client first locates [Schedules](StructureDefinition-at-scheduling-schedule.html) and then retrieves [Slots](StructureDefinition-at-scheduling-slot.html) with `Slot.status = free` (see [Find available Slots](interactions.html#find-available-slots-for-potential-appointments)). A specific Slot can be reserved with the [$hold](OperationDefinition-slot-hold.html) operation (setting `Slot.status` to `busy-tentative`), and only at the final step is an [Appointment](StructureDefinition-at-scheduling-appointment.html) created via [$book](OperationDefinition-appointment-book.html), referencing the chosen Slot. `Slot` is therefore a first-class, client-facing Resource; the `Appointment` represents the resulting booking, and the Scheduling Server keeps the Slot status in sync with it.

- **IHE Scheduling (Appointment-centric discovery).** Availability is exposed as *proposed* `Appointment` Resources. The *Find Potential Appointments* transaction ([ITI-115](https://profiles.ihe.net/ITI/Scheduling/ITI-115.html)) returns a `searchset` Bundle of `Appointment` Resources, and the subsequent *Hold* ([ITI-116](https://profiles.ihe.net/ITI/Scheduling/ITI-116.html)) and *Book* ([ITI-117](https://profiles.ihe.net/ITI/Scheduling/ITI-117.html)) transactions operate on that same `Appointment`. `Schedule` and `Slot` exist conceptually but remain largely server-internal — the client never browses Slots directly. The entire workflow is Appointment-centric.

- **ISiK Terminplanung (Slot-based, single-system).** ISiK defines explicit profiles for `Schedule` (*ISiKKalender*), `Slot` (*ISiKTerminblock*) and `Appointment` (*ISiKTermin*). As in this IG, free Slots are queried first and an Appointment is then booked (`$book`). The model is close to this guide's Slot-based approach, but it is scoped to a single confirming system (a hospital information system) rather than to discovery across many independent servers.

This guide deliberately follows the Slot-based model (like ISiK, and unlike IHE) because exposing concrete bookable Slots fits the Austrian online-booking use cases — including the cascading aggregation of availability across many Scheduling Servers — better than exchanging fully-formed candidate Appointments.

#### Covered use cases

- **This IG.** Cross-organizational *online* appointment booking in Austria. It defines two scenarios: [simple appointment booking](scenarios.html#simple-appointment-booking) (a client talking directly to one server, e.g. a GP system or HIS) and the [central scheduling platform](scenarios.html#central-scheduling-platform), where one platform aggregates and cascades requests across multiple Scheduling Servers (a broker/marketplace model). On top of the booking flow it adds **healthcare service provider discovery** via the [$findHSP](OperationDefinition-healthcareService-provider-find.html) operation (find a provider by service type, specialty, region/ZIP, or availability) and explicit support for **virtual appointments** such as video consultations.

- **IHE Scheduling.** A vendor-neutral, international API for *accessing and booking* a patient's appointments against a single scheduling source. It defines the transactions *Find Potential Appointments* (ITI-115), *Hold* (ITI-116), *Book* (ITI-117) and *Find Existing Appointments* (ITI-118). It does not specify cross-server aggregation/cascading and has no dedicated provider-search transaction.

- **ISiK Terminplanung.** Part of the German *Informationstechnische Systeme in Krankenhäusern* program (legally anchored in the Krankenhauszukunftsgesetz, KHZG). It targets patient portals and digital intake connecting to a hospital information system, covering retrieval of treatment services, querying of availability, booking, change notifications and patient registration. It explicitly does **not** aim to be a complete model for internal hospital resource planning, and it is intramural (single institution) in scope.

#### Summary

| Aspect | This IG (AT Scheduling) | IHE Scheduling | ISiK Terminplanung (Stufe 5) |
| --- | --- | --- | --- |
| FHIR version | R5 | R4 (4.0.1) | R4 (German base profiles) |
| Availability browsed as | `Slot` (`status = free`) | proposed `Appointment` (Bundle) | `Slot` (*ISiKTerminblock*) |
| Reservation / hold | `$hold` on `Slot` | ITI-116 *Hold* on `Appointment` | — |
| Booking | `$book` on `Appointment` | ITI-117 *Book* on `Appointment` | `$book` on `Appointment` |
| Provider discovery | `$findHSP` operation | not covered | not covered |
| Cross-server aggregation | yes (central platform, cascading) | no | no (single system) |
| Virtual / video appointments | explicitly supported | not specified | not in focus |
| Primary scope | Austrian, cross-organizational online booking | international, generic access API | German hospitals (KHZG), patient portals |


### Dependencies
This guide is based on the <a href="{{site.data.fhir.path}}">FHIR® R5</a> specification.  In addition, this guide also relies on a number of parent implementation guides:

{% include dependency-table-short.xhtml %}

### Known Issues
In this implementation guide a ValueSet [AT Scheduling Service Type](ValueSet-AtSchedulingServiceType.html) is used in several Profiles. In the future, the ValueSet will contain an extendable set of suggested codes, but creating a single harmonized List with codes from all vendors is out of scope. This ValueSet currently only serves as a placeholder and contains a single entry in order to provide useful examples for the profiles that make use of it.

Furthermore, the transmission of notifications or reminders to Patients is out of scope for this implementation guide. While notifications are mentioned in the context of cancellation workflows, the IG does not define mechanisms or channels for directly delivering messages to Patients.

In this implementation guide, no rules for cancellation of appointments (see Interaction [Cancellation by Scheduling Server](interactions.html#cancellation-by-scheduling-server)) by Scheduling Server are defined. Those rules are subject to the Scheduling Server's business logic and therefor out of scope.

### Governance

HL7® Austria is an official Affiliate of HL7® International. Within HL7® Austria the technical committee for FHIR® (TC FHIR®) is responsible to promote and disseminate the new upcoming standard HL7® FHIR®.
The TC FHIR® deals with the standard-compliant and coordinated usage of HL7® FHIR® based communication solutions.
It coordinates and describes necessary localizations and offers concrete help for FHIR®-compliant interfaces.

### License and Legal Terms
HL7®, HEALTH LEVEL SEVEN® and FHIR® are trademarks owned by Health Level Seven International, registered with the United States Patent and Trademark Office.

This Implementation Guide contains and references intellectual property owned by third parties (“Third Party IP”). Acceptance of these License Terms does not grant any rights with respect to Third Party IP. The licensee alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize Third Party IP in connection with the specification or otherwise.
