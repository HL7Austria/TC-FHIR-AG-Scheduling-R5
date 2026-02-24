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