{
  "resourceType": "Appointment",
  "id": "HL7ATSchedulingAppointmentExample01",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Termin für Herrn Max Mustermann mit Frau Dr. Melanie Musterärztin am 01.06.2025 von 09:00 bis 09:30 Uhr. Grund des Termins: Routineuntersuchung beim Hausarzt.</div>"
  },
  "status": "booked",
  "description": "Routineuntersuchung beim Hausarzt",
  "start": "2025-06-01T09:00:00+02:00",
  "end": "2025-06-01T09:30:00+02:00",
  "created": "2025-05-10T14:23:00+02:00",
  "participant": [
    {
      "actor": {
        "reference": "Patient/HL7ATCorePatientExample01",
        "display": "Max Mustermann"
      },
      "status": "accepted",
      "required": true
    },
    {
      "actor": {
        "reference": "Practitioner/HL7ATCorePractitionerExample01",
        "display": "Melanie Musterärztin"
      },
      "status": "accepted",
      "required": true
    }
  ],
  "appointmentType": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0276",
        "code": "CHECKUP",
        "display": "Routineuntersuchung"
      }
    ]
  },
  "minutesDuration": 30
}