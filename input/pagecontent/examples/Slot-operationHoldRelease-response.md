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