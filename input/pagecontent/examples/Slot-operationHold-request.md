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