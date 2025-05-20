
- For input parameters that are codes, the simple FHIR [token](https://hl7.org/fhir/R5/search.html#token) search parameter type is used instead of the complex ```CodeableConcept``` datatype. This allows either the 'GET' or the 'POST' syntax to be used to initiate the interaction in many cases. The ```Reference``` datatype is used for resources references, which allows the requester to use either a reference to existing resource, or an identifier ([logical reference](https://hl7.org/fhir/R5/references-definitions.html#Reference.identifier)).
- To set the upper limit on the total number of available appointment options to return use the standard [```_count```](https://hl7.org/fhir/R5/search.html#count) search parameter.

<h4> For the Scheduling Client </h4>
This query operation is used by the Scheduling Client to find healthcare service providers that offer a specific healthcare service. This can be achieved by:
- using a HealthcareService instance (as full resource) as search input
- identifying the healthcare service via a code (```HealthcareService.category```, ```HealthcareService.type``` or ```HealthcareService.specialty```) 

In addition to that a Scheduling Client can provide further filter criteria in its search like:
- a region where a healthcare service should ideally be offered with either a Location reference or a zip code
- the desired availablity time of a healthcare service

<h5> Pre-Conditions </h5>
The following pre-conditions must be fullfilled for the ```$findHSP``` operation to be successful:
- The general information about the HealthcareService identification itself is already available in advance
- This means that either the client has already searched for the healthcare service and has fetched the corresponding HealthcareService resource instance or the client is aware of the codes for category, type or specialty of it.

If a healthcare service information is not provided by the client in this query operation, the Scheduling Server SHALL reject the operation and provide a corresponding explanation in the OperationOutcome.

<h4> For the Scheduling Server </h4>
Based on the search input the Scheduling Server has to look up the corresponding healthcare service as well as the healthcare service providers that offer it. Depending on the implementation and the supported scenarios for the scheduling workflow, the server has to do this internally and/or with its connected systems.
It SHALL respond to the client with a Bundle containing the HealthcareService resource and a list of healthcare service providers (Organization, Practitioner, PractitionerRole) that offer the requested service. Furthermore it SHALL contain an OperationOutcome with errors, warnings or information as a result of processing the operation.

<h4> Examples </h4>
<h5> Search for healthcare service provider via service type</h5>
furthermore, the district and the availability were added as search criteria
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
Response to the search request:
```
HTTP 200 OK
[& other headers]

<Bundle xmlns="http://hl7.org/fhir">
    <id value="bundle-example"/> 
    <meta> 
        <lastUpdated value="2014-08-18T01:43:30Z"/> 
    </meta>  
    <type value="searchset"/>   
    <total value="3"/> 
    <entry>
        <fullUrl value="[baseURL]/HealthcareService/HL7ATSchedulingHealthcareServiceExample01"/> 
        <resource> 
            <HealthcareService xmlns="http://hl7.org/fhir">
                <id value="HL7ATSchedulingHealthcareServiceExample01"/>
                <meta>
                    <profile value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/StructureDefinition/at-scheduling-healthcareservice"/>
                </meta>
                <active value="true"/>
                <type>
                    <coding>
                        <system value="http://hl7.at/fhir/TC-FHIR-AG-Scheduling-R5/R5/ValueSet/AtSchedulingServiceType"/>
                        <code value="65"/>
                        <display value="Physiotherapy"/>
                    </coding>
                </type>
            </HealthcareService>
        </resource>
    </entry>
    <entry> 
        <fullUrl value="[baseURL]/PractitionerRole/HL7ATCorePractitionerRoleExample01"/> 
        <resource> 
            <PractitionerRole xmlns="http://hl7.org/fhir">
                <id value="HL7ATCorePractitionerRoleExample01"/>
                <meta>
                    <profile
                            value="http://hl7.at/fhir/HL7ATCoreProfiles/5.0.0/StructureDefinition/at-core-practitionerRole"/>
                </meta>
                <active value="true"/>
                <practitioner>
                    <reference value="Practitioner/HL7ATCorePractitionerExample01"/>
                </practitioner>
                <code>
                    <coding>
                    <system
                            value="https://termgit.elga.gv.at/ValueSet/hl7-at-practitionerrole"/>
                    <code value="100"/>
                    <display value="Ärztin/Arzt für Allgemeinmedizin"/>
                    </coding>
                </code>
                <specialty>
                    <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="419772000"/>
                    <display value="Family practice"/>
                    </coding>
                </specialty>
                <specialty>
                    <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="410005002"/>
                    <display value="Dive medicine"/>
                    </coding>
                </specialty>
                <healthcareService>
                    <reference value="HealthcareService/HL7ATSchedulingHealthcareServiceExample01"/>
                </healthcareService>
                <availability>
                    <availableTime>
                        <daysOfWeek value="mon"/>
                        <availableStartTime value="07:00:00"/>
                        <availableEndTime value="12:00:00"/>
                    </availableTime>
                    <availableTime>
                        <daysOfWeek value="tue"/>
                        <availableStartTime value="07:30:00"/>
                        <availableEndTime value="12:30:00"/>
                    </availableTime>
                    <availableTime>
                        <daysOfWeek value="thu"/>
                        <allDay value="true"/>
                    </availableTime>
                    <notAvailableTime>
                        <description value="Urlaub"/>
                        <during>
                            <start value="2024-08-01"/>
                            <end value="2024-08-31"/>
                        </during>
                    </notAvailableTime>
                    <notAvailableTime>
                        <description value="Zwischen den Feiertagen geschlossen."/>
                        <during>
                            <start value="2024-12-24"/>
                            <end value="2025-01-06"/>
                        </during>
                    </notAvailableTime>
                </availability>
            </PractitionerRole> 
        </resource> 
    </entry> 
    <entry> 
        <fullUrl value="[baseURL]/Practitioner/HL7ATCorePractitionerExample01"/> 
        <resource> 
            <Practitioner xmlns="http://hl7.org/fhir">
                <id value="HL7ATCorePractitionerExample01"/>
                <meta>
                    <profile value="http://hl7.at/fhir/HL7ATCoreProfiles/5.0.0/StructureDefinition/at-core-practitioner"/>
                </meta>
                <identifier>
                    <system value="urn:ietf:rfc:3986"/>
                    <value value="urn:oid:1.2.40.0.34.99.4613.4"/>
                    <assigner>
                        <display value="Bundesministerium für Gesundheit"/>
                    </assigner>
                </identifier>
                <identifier>
                    <system value="urn:oid:1.2.40.0.10.1.4.3.2"/>
                    <value value="987654321"/>
                    <assigner>
                        <display value="Dachverband der österreichischen Sozialversicherungsträger"/>
                    </assigner>
                </identifier>
                <active value="true"/>
                <name>
                    <family value="Musterärztin"/>
                    <given value="Melanie"/>
                    <prefix value="Prof. Dr."/>
                </name>
                <telecom>
                    <system value="email"/>
                    <value value="office@musterpraxis.at"/>
                    <use value="work"/>
                </telecom>
                <telecom>
                    <system value="phone"/>
                    <value value="+436500987654321"/>
                    <use value="work"/>
                </telecom>
                <gender value="female"/>
                <address>
                    <use value="work"/>
                    <type value="both"/>
                    <line value="Mozartgasse 8 Stiege 2">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="Mozartgasse"/>
                    </extension>
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="8"/>
                    </extension>
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="Stiege 2"/>
                    </extension>
                    <extension url="http://hl7.at/fhir/HL7ATCoreProfiles/5.0.0/StructureDefinition/at-core-ext-address-additionalInformation">
                        <valueString value="Barrierefreier Zugang"/>
                    </extension>
                    </line>
                    <city value="St. Wolfgang"/>
                    <state value="Salzburg"/>
                    <postalCode value="5350"/>
                    <country value="AUT"/>
                </address>
            </Practitioner> 
        </resource> 
    </entry> 
</Bundle> 
```