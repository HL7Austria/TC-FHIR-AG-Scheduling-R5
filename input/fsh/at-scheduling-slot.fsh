/*##############################################################################
# Type:       FSH-File for an FHIR® Profile
# About:      HL7® Austria FHIR® Scheduling Profile for Slot.
# Created by: HL7® Austria, TC FHIR®
##############################################################################*/

Profile:        HL7ATSchedulingSlot
Parent:         Slot
Id:             at-scheduling-slot
Title:          "HL7® AT Scheduling Slot Profile"
Description:    "HL7® Austria FHIR® Scheduling Profile for slot data in Austria."

// Replace references to FHIR resources with references to profiles
* serviceType only CodeableReference(HL7ATSchedulingHealthcareService)
* schedule only Reference(HL7ATSchedulingSchedule)

// Add binding to AtSchedulungServiceType
* serviceType from AtSchedulingServiceType (extensible)

* extension contains 
    SlotEncounterClassExt named SlotEncounterClass 0..* and
    AppointmentBookingUrlExt named bookingURL 0..1 and
    CancellationPolicy named cancellationPolicy 0..1