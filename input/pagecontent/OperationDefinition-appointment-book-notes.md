
<h4> Book a New Appointment </h4>
This operation is used by the Scheduling Client to request the booking of an appointment from a Scheduling Server. The Scheduling Client provides a full Appointment resource that SHALL have the status ```proposed```.

If the appointment ```$book``` operation was successful the Scheduling Server returns an Appointment resource with the the value of ```Appointment.status``` set to ```booked```. If the Appointment needs to be manually confirmed, the Scheduling Server ```Appointment.status``` of the returned Appointment is set to ```pending```.

The Scheduling Client is expected to convey the outcome to the user who requested the creation of the appointment, and to record the current state of the appointment in the corresponding system(s), including any error conditions..

<h5> Pre-Conditions </h5>
The following pre-conditions must be fullfilled for the $book operation to be successful:
- The referenced patient in ```Appointment.subject``` SHALL already exist on, or must be known to the Scheduling Server
- If a HealthcareService is provided in ```Appointment.serviceType``` it SHALL already exist on or must be known to and supported by the Scheduling Server
- If a Slot is provided in ```Appointment.slot``` the Slot SHALL exist and must be available for booking on the Scheduling Server

If any of those pre-conditions are not met, the Scheduling Server SHALL reject the operation and provide a corresponding explanation in the OperationOutcome.

<h5> Examples </h5>
<h5> Request the booking of an appointmetn </h5>
```
POST: [baseURL]/Appointment/$book

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="appointment-resource" />
    <resource>
        <Appointment xmlns="http://hl7.org/fhir">
            <id value="HL7ATSchedulingAppointmentExample01"/>
            <meta>
                <profile value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-appointment"/>
            </meta>
            <status value="proposed"/>
            <serviceType>
                <concept>
                    <coding>
                        <system value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"/>
                        <code value="65"/>
                        <display value="Physiotherapy"/>
                    </coding>
                </concept>
            </serviceType>
            <appointmentType>
                <coding>
                    <system value="http://terminology.hl7.org/CodeSystem/v2-0276"/>
                    <code value="CHECKUP"/>
                    <display value="A routine check-up, such as an annual physical"/>
                </coding>
            </appointmentType>
            <description value="Routineuntersuchung beim Hausarzt"/>
            <start value="2025-06-01T09:00:00+02:00"/>
            <end value="2025-06-01T09:30:00+02:00"/>
            <minutesDuration value="30"/>
            <created value="2025-05-10T14:23:00+02:00"/>
            <slot>
                <reference value="Slot/HL7ATSchedulingSlotExample01-free"/>
            </slot>
            <subject>
                <reference value="Patient/HL7ATCorePatientExample01"/>
            </subject>
            <participant>
                <actor>
                    <reference value="Patient/HL7ATCorePatientExample01"/>
                    <display value="Max Mustermann"/>
                </actor>
                <required value="true"/>
                <status value="accepted"/>
            </participant>
            <participant>
                <actor>
                    <reference value="Practitioner/HL7ATCorePractitionerExample01"/>
                    <display value="Melanie Musterärztin"/>
                </actor>
                <required value="true"/>
                <status value="accepted"/>
            </participant>
        </Appointment>
    </resource>
  </parameter>
</Parameters>
```
Response to the book request:
```
HTTP 200 OK
[& other headers]

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="appointment" />
    <resource>
        <Appointment xmlns="http://hl7.org/fhir">
            <id value="HL7ATSchedulingAppointmentIdFromServer"/>
            <meta>
                <profile value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-appointment"/>
            </meta>
            <status value="booked"/>
            <serviceType>
                <concept>
                    <coding>
                        <system value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"/>
                        <code value="65"/>
                        <display value="Physiotherapy"/>
                    </coding>
                </concept>
            </serviceType>
            <appointmentType>
                <coding>
                    <system value="http://terminology.hl7.org/CodeSystem/v2-0276"/>
                    <code value="CHECKUP"/>
                    <display value="A routine check-up, such as an annual physical"/>
                </coding>
            </appointmentType>
            <description value="Routineuntersuchung beim Hausarzt"/>
            <start value="2025-06-01T09:00:00+02:00"/>
            <end value="2025-06-01T09:30:00+02:00"/>
            <minutesDuration value="30"/>
            <created value="2025-05-10T14:23:00+02:00"/>
            <slot>
                <reference value="Slot/HL7ATSchedulingSlotExample01-free"/>
            </slot>
            <subject>
                <reference value="Patient/HL7ATCorePatientExample01"/>
            </subject>
            <participant>
                <actor>
                    <reference value="Patient/HL7ATCorePatientExample01"/>
                    <display value="Max Mustermann"/>
                </actor>
                <required value="true"/>
                <status value="accepted"/>
            </participant>
            <participant>
                <actor>
                    <reference value="Practitioner/HL7ATCorePractitionerExample01"/>
                    <display value="Melanie Musterärztin"/>
                </actor>
                <required value="true"/>
                <status value="accepted"/>
            </participant>
        </Appointment>
    </resource>
  </parameter>
  <parameter>
    <name value="outcome" />
    <resource>
      <OperationOutcome>
        <id value="Outcome1"/>
        <issue>
            <severity value="information" />
            <code value="success"/> 
            <details>
                <text value="The appointment was booked successfully." />
            </details>
        </issue>
      </OperationOutcome>
    </resource>
</Parameters>
```