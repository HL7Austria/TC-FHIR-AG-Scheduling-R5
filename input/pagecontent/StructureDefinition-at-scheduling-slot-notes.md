<table>
  <thead>
    <tr class="header">
      <th>Name</th>
      <th>Type</th>
      <th>Description</th>
      <th>Expression</th>
      <th>In Common</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td markdown="span">[schedule](https://hl7.org/fhir/slot-search.html#Slot-schedule)</td>
      <td markdown="span">[reference](https://hl7.org/fhir/R5/search.html#reference)</td>
      <td markdown="span">The Schedule Resource that we are seeking a slot within</td>
      <td markdown="span">Slot.schedule [(Schedule)](StructureDefinition-at-scheduling-schedule.html)</td>
      <td markdown="span"></td>
    </tr>
    <tr>
      <td markdown="span">[service-type](https://hl7.org/fhir/slot-search.html#Slot-service-type)</td>
      <td markdown="span">[token](https://hl7.org/fhir/R5/search.html#token)</td>
      <td markdown="span">The type (by coding) of appointments that can be booked into the slot</td>
      <td markdown="span">Slot.serviceType.concept</td>
      <td markdown="span"></td>
    </td>
    </tr>
  </tbody>
</table>
