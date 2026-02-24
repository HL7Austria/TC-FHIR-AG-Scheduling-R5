```
POST: [baseURL]/HealthcareService/$findHSP

<Parameters xmlns="http://hl7.org/fhir">
    <parameter>
        <name value="healthcareService-type" />
        <valueString value="healthcareService-type=http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType|65" />
    </parameter>
    <parameter>
        <name value="healthcareService-zipCodeArea" />
        <valueString value="5350" />
    </parameter>
    <parameter>
        <name value="healthcareService-availability" />
        <valueAvailability>
            <availableTime>
                <daysOfWeek value="mon"/>
                <availableStartTime value="08:00:00"/>
                <availableEndTime value="10:00:00"/>
            </availableTime>
            <availableTime>
                <daysOfWeek value="tue"/>
                <availableStartTime value="08:00:00"/>
                <availableEndTime value="10:00:00"/>
            </availableTime>
        </valueAvailability>
    </parameter>
</Parameters>
```