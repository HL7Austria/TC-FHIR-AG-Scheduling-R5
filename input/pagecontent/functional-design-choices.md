This page documents the key design choices made in this implementation guide and the rationale behind them.

### FHIR R5 and HL7® AT Core

This implementation guide is based on FHIR R5 and builds on the [HL7® AT Core profiles (R5)](https://fhir.hl7.at/HL7-AT-FHIR-Core-R5/). R5 was chosen because it significantly improves the scheduling-related resources compared to R4, e.g. the `Appointment.virtualService` element for virtual appointments and the use of `CodeableReference` for linking Schedules, Slots and Appointments to HealthcareServices. As a newly created guide without an existing R4-based installed base, there was also no legacy constraint that would have justified staying on an older FHIR version. Wherever an Austrian core profile exists (Patient, Practitioner, PractitionerRole, Organization, Location), it is referenced instead of the base resource to ensure consistency with other Austrian implementation guides.

### Adaptation of existing implementation guides

Rather than designing a scheduling workflow from scratch, this guide adapts the concepts of the German [ISiK Modul "Terminplanung"](https://simplifier.net/isik-terminplanung-v4/~introduction) and [IHE ITI Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) implementation guides to the Austrian context. This keeps the Austrian specification aligned with internationally established patterns and lowers the implementation effort for vendors already familiar with those guides.

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
