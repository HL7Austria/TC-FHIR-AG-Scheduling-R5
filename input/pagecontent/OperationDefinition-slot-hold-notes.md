
This operation is used by the Scheduling Client and Scheduling Server Actors. The Hold Slot operation is used to request that a specific appointment-slot (selected from one of the available potential slots returned with the response of a preceding query) is held by the Scheduling Server, until the appointment is booked, cancelled, or the hold on the slot is released or expires.

The Scheduling Server is expected to hold the necessary time slots and resources for the potential appointment to take place at the given time and for the given duration.

Note that it is possible that between the time the Find Potential Appointments response was received, and the time the Hold Slot request is issued, the requested slot is no longer available. In such case, the server SHALL respond with an OperationOutcome that describes the issue.

<h4> Examples </h4>
<h5> Request Hold </h5>
```
POST: [baseURL]/Slot/$hold

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="slot-reference" />
    <valueReference>
      <reference value="Slot/HL7ATSchedulingSlotExample01-free" />
    </valueReference>
  </parameter>
  <parameter>
    <name value="slot-status" />
    <valueCode value="busy-tentative" />
  </parameter>
</Parameters>
```
Response to the hold request:
```
HTTP 200 OK
[& other headers]

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="slot" />
    <resource>
        <Slot xmlns="http://hl7.org/fhir">
            <id value="HL7ATSchedulingSlotExample01-free"/>
            <meta>
                <profile value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-slot"/>
            </meta>
            <extension url="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/slot-encounter-class">
                <valueCodeableConcept>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/v3-ActCode"/>
                        <code value="AMB"/>
                        <display value="ambulatory"/>
                    </coding>
                </valueCodeableConcept>
            </extension>
            <serviceType>
                <concept>
                    <coding>
                        <system value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"/>
                        <code value="65"/>
                        <display value="Physiotherapy"/>
                    </coding>
                </concept>
            </serviceType>
            <schedule>
                <reference value="Schedule/HL7ATSchedulingScheduleExample01"/>
            </schedule>
            <status value="busy-tentative"/>
            <start value="2025-09-15T08:00:00Z"/>
            <end value="2025-09-15T09:00:00Z"/>
        </Slot>
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
                <text value="Slot hold completed successfully" />
            </details>
        </issue>
      </OperationOutcome>
    </resource>
</Parameters>
```

<h5> Release Hold </h5>
```
POST: [baseURL]/Slot/$hold

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="slot-reference" />
    <valueReference>
      <reference value="Slt/HL7ATSchedulingSlotExample01-free" />
    </valueReference>
  </parameter>
  <parameter>
    <name value="slot-status" />
    <code value="free" />
  </parameter>
</Parameters>
```
Response to the hold release request:
```
HTTP 200 OK
[& other headers]

<Parameters xmlns="http://hl7.org/fhir">
  <parameter>
    <name value="slot" />
    <resource>
        <Slot xmlns="http://hl7.org/fhir">
            <id value="HL7ATSchedulingSlotExample01-free"/>
            <meta>
                <profile value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-slot"/>
            </meta>
            <extension url="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/slot-encounter-class">
                <valueCodeableConcept>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/v3-ActCode"/>
                        <code value="AMB"/>
                        <display value="ambulatory"/>
                    </coding>
                </valueCodeableConcept>
            </extension>
            <serviceType>
                <concept>
                    <coding>
                        <system value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"/>
                        <code value="65"/>
                        <display value="Physiotherapy"/>
                    </coding>
                </concept>
            </serviceType>
            <schedule>🔗 
                <reference value="Schedule/HL7ATSchedulingScheduleExample01"/>
            </schedule>
            <status value="free"/>
            <start value="2025-09-15T08:00:00Z"/>
            <end value="2025-09-15T09:00:00Z"/>
        </Slot>
    </resource>
  </parameter>
  <parameter>
    <name value="outcome" />
    <resource>
      <OperationOutcome>
        <id value="Outcome2"/>
        <issue>
            <severity value="information" />
            <code value="success"/> 
            <details>
                <text value="Slot hold released successfully" />
            </details>
        </issue>
      </OperationOutcome>
    </resource>
</Parameters>
```
