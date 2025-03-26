Extension:    SlotEncounterClassExt
Id:           slot-encounter-class
Title:        "Slot Encounter Class"
Description:  "An encounter class similar to (Appointment.class)[https://www.hl7.org/fhir/appointment-definitions.html#Appointment.class] for classification of possible mode of encounter"
Context: Slot, HL7ATSchedulingSlot

* value[x] 0..0
* extension contains 
    code 0..1
* extension[code].value[x] only CodeableConcept
* extension[code].value[x] from EncounterClass (extensible)
* extension[code].extension 0..0
