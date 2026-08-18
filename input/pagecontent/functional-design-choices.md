This page documents the key design choices made in this implementation guide and the rationale behind them.

### FHIR R5 and HL7® AT Core

This implementation guide is based on FHIR R5 and builds on the [HL7® AT Core profiles (R5)](https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/). R5 was chosen because it significantly improves the scheduling-related resources compared to R4, e.g. the `Appointment.virtualService` element for virtual appointments and the use of `CodeableReference` for linking Schedules, Slots and Appointments to HealthcareServices. As a newly created guide without an existing R4-based installed base, there was also no legacy constraint that would have justified staying on an older FHIR version. Wherever an Austrian core profile exists (Patient, Practitioner, PractitionerRole, Organization, Location), it is referenced instead of the base resource to ensure consistency with other Austrian implementation guides.

### Adaptation of existing implementation guides

Rather than designing a scheduling workflow from scratch, this guide adapts the concepts of the German [ISiK Modul "Terminplanung"](https://simplifier.net/guide/isik-terminplanung-stufe-5) (gematik) and [IHE Scheduling](https://profiles.ihe.net/ITI/Scheduling) (IHE ITI) implementation guides to the Austrian context. This keeps the Austrian specification aligned with internationally established patterns and lowers the implementation effort for vendors already familiar with those guides. The most important differences concern how the FHIR Resources `Slot` and `Appointment` are used to discover availability, and which use cases are in scope.

#### Usage of Resources: Appointment vs. Slot

The central conceptual difference between the three guides is *which Resource a Scheduling Client browses when looking for availability*.

- **This IG (Slot-centric discovery).** Availability is exposed as `Slot` Resources. A client first locates [Schedules](StructureDefinition-at-scheduling-schedule.html) and then retrieves [Slots](StructureDefinition-at-scheduling-slot.html) with `Slot.status = free` (see [Find available Slots](functional-transactions.html#find-available-slots-for-potential-appointments)). A specific Slot can be reserved with the [$hold](OperationDefinition-slot-hold.html) operation (setting `Slot.status` to `busy-tentative`), and only at the final step is an [Appointment](StructureDefinition-at-scheduling-appointment.html) created via [$book](OperationDefinition-appointment-book.html), referencing the chosen Slot. `Slot` is therefore a first-class, client-facing Resource; the `Appointment` represents the resulting booking, and the Scheduling Server keeps the Slot status in sync with it.

- **IHE Scheduling (Appointment-centric discovery).** Availability is exposed as *proposed* `Appointment` Resources. The *Find Potential Appointments* transaction ([ITI-115](https://profiles.ihe.net/ITI/Scheduling/ITI-115.html)) returns a `searchset` Bundle of `Appointment` Resources, and the subsequent *Hold* ([ITI-116](https://profiles.ihe.net/ITI/Scheduling/ITI-116.html)) and *Book* ([ITI-117](https://profiles.ihe.net/ITI/Scheduling/ITI-117.html)) transactions operate on that same `Appointment`. `Schedule` and `Slot` exist conceptually but remain largely server-internal — the client never browses Slots directly. The entire workflow is Appointment-centric.

- **ISiK Terminplanung (Slot-based, single-system).** ISiK defines explicit profiles for `Schedule` (*ISiKKalender*), `Slot` (*ISiKTerminblock*) and `Appointment` (*ISiKTermin*). As in this IG, free Slots are queried first and an Appointment is then booked (`$book`). The model is close to this guide's Slot-based approach, but it is scoped to a single confirming system (a hospital information system) rather than to discovery across many independent servers.

This guide deliberately follows the Slot-based model (like ISiK, and unlike IHE) because exposing concrete bookable Slots fits the Austrian online-booking use cases — including the cascading aggregation of availability across many Scheduling Servers — better than exchanging fully-formed candidate Appointments.

#### Covered use cases

- **This IG.** Cross-organizational *online* appointment booking in Austria. It defines two scenarios: [simple appointment booking](use-case-simple-appointment-booking.html) (a client talking directly to one server, e.g. a GP system or HIS) and the [central scheduling platform](use-case-central-scheduling-platform.html), where one platform aggregates and cascades requests across multiple Scheduling Servers (a broker/marketplace model). On top of the booking flow it adds **healthcare service provider discovery** via the [$findHSP](OperationDefinition-healthcareService-provider-find.html) operation (find a provider by service type, specialty, region/ZIP, or availability) and explicit support for **virtual appointments** such as video consultations.

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

### Two generic, cascadable actors

The guide deliberately defines only two [System Actors](functional-system-actors.html) — Scheduling Client and Scheduling Server — instead of modelling every participating system type. A system may implement both roles at once: a central scheduling platform acts as a Scheduling Server towards patients' apps while acting as a Scheduling Client towards the primary systems it aggregates. This makes the same set of transactions reusable for both the [simple appointment booking](use-case-simple-appointment-booking.html) and the [central scheduling platform](use-case-central-scheduling-platform.html) scenario, including cascading chains of Scheduling Servers.

### Standard REST where possible, custom operations where necessary

Discovery of HealthcareServices, Schedules, Slots and existing Appointments as well as updates to Appointments use standard FHIR RESTful interactions (search, read, update), because the base specification already covers them well. Custom operations are only introduced where a plain RESTful interaction cannot express the required semantics:

- [$findHSP](OperationDefinition-healthcareService-provider-find.html) — an operation designed by this working group: searching for Healthcare Service *Providers* based on a service, region and desired availability spans multiple resource types and cannot be expressed as a single standard search.
- [$hold](OperationDefinition-slot-hold.html) — adapted from the hold concept of IHE ITI Scheduling: temporarily reserving a Slot is a state transition with server-side business logic (expiry, conflict handling), not a simple update.
- [$book](OperationDefinition-appointment-book.html) — following ISiK Terminplanung and IHE ITI Scheduling, booking is modelled as an operation rather than a plain create of an Appointment. This keeps implementations aligned with those guides and reflects that booking carries transactional behaviour (validating the request, updating the Slot status, deciding between `booked`, `pending` and `cancelled`) that goes beyond a simple create.

### Temporary reservation of Slots ($hold)

Between selecting a Slot and completing the booking (e.g. while a patient fills in personal data), the Slot may be taken by another party. The optional [$hold](OperationDefinition-slot-hold.html) operation lets a Scheduling Client reserve a Slot by setting its status to `busy-tentative`. The Scheduling Server — not the client — decides how long a hold lasts and communicates the expiry via the `held-until` parameter. This keeps control over resource blocking with the system that owns the calendar and prevents clients from locking Slots indefinitely.

### Status-driven Appointment lifecycle

Cancellation and postponement are expressed through updates of the Appointment (`status`, `start`/`end`). Keeping the status of affected Slots in sync with the Appointment (freeing the old Slot, occupying the new one) is always the responsibility of the Scheduling Server, since only the server owning the calendar can guarantee consistency.

### Identifiers over logical IDs

Logical IDs (`Resource.id`) are unique only within a single FHIR server and may change when a resource is copied or migrated, whereas business identifiers (`Resource.identifier`) are stable values designed for use across different systems and contexts. Implementers should therefore prefer identifiers when referencing resources across systems, as described in [General Information](functional-transactions.html#usage-of-logical-ids-vs-identifiers).

### Extensions for gaps in the base specification

Extensions are only defined where neither FHIR R5 nor the AT Core profiles provide a suitable element:

- [Appointment Booking URL](StructureDefinition-appointment-booking-url.html) on Slot — enables the redirect to an external booking page of a provider, supporting the "booking with external provider" flow of the central platform scenario.
- [Slot Encounter Class](StructureDefinition-slot-encounter-class.html) on Slot — allows advertising whether a Slot is bookable e.g. as an on-site or virtual visit before an Appointment exists.
- [Cancellation Policy](StructureDefinition-at-scheduling-ext-cancellationPolicy.html) — communicates the provider's cancellation conditions to the patient.
- [Postponement Reason](StructureDefinition-appointment-postponementReason.html) on Appointment — records why an Appointment was moved, analogous to the standard `cancellationReason`.
- [VirtualServiceDetail](StructureDefinition-virtual-service-detail.html) on Appointment.participant — provides personalized dial-in details (e.g. individual links or secrets) per participant, whereas the standard `Appointment.virtualService` element only supports details shared by all participants.

### Placeholder value set for service types

The [AT Scheduling Service Type](ValueSet-AtSchedulingServiceType.html) value set is currently a placeholder bound extensibly to the affected `serviceType` elements. A nationally agreed coding of bookable services does not exist yet; the extensible binding allows implementers to use their own codes until such a value set is established.

### Out of scope

The actual delivery of notifications and reminders to patients (e.g. SMS, email) is intentionally out of scope. The guide only defines which actor is responsible for triggering appointment-related messages (see [Messages](functional-transactions.html#messages)); the transport channels are subject to bilateral agreements.
