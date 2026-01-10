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
            <description value="Physiotherapie - Einzelbehandlung 30 Minuten"/>
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