Extension:    VirtualServiceDetailExt
Id:           virtual-service-detail
Title:        "VirtualServiceDetail"
Description:  "Represents personalized details for a virtual service. This extension is meant to be used on appointment.participant if personalized Details (e.g. individual links or secrets) per participant exist. If the details are the same for all participants, Appointment.virtualService should be used instead. **Warning! Due to a bug, this extension contains a workaround. Instead of the custom complex data structure defined here, VirtualServiceDetail will be used as an extension on Appointment.participant in the future**"
Context: Appointment.participant

// // Does not work - fails with Sushi error The type "VirtualServiceDetail" does not match any of the allowed types: base64Binary or boolean or Canonical() or code or date or dateTime or decimal or id or instant or integer or integer64 or markdown or oid or positiveInt or string or time or unsignedInt or uri or url or uuid or Address or Age or Annotation or Attachment or CodeableConcept or CodeableReference() or Coding or ContactPoint or Count or Distance or Duration or HumanName or Identifier or Money or Period or Quantity or Range or Ratio or RatioRange or Reference() or SampledData or Signature or Timing or ContactDetail or DataRequirement or Expression or ParameterDefinition or RelatedArtifact or TriggerDefinition or UsageContext or Availability or ExtendedContactDetail or Dosage or Meta (00:00.347 / 00:05.153, 22Mb)
// // There is no valueVirtualServiceDetail on https://www.hl7.org/fhir/extensibility.html#extension so likely it is not usable
//* value[x] only VirtualServiceDetail



// // workaround: redefine VirtualService as complex extension instead of using VirtualServiceDetails Metadata type
* extension contains
    channelType 1..1 D and
    address 0..* D and
    additionalInfoURL 0..1 D and
    maxParticipants 0..1 D and
    sessionKey 0..1 D

* extension[channelType].value[x] only Coding
* extension[channelType].valueCoding from VirtualServiceType (required)

* extension[address] ^short = "contact address/number."
* extension[address] contains
    addressUrl 0..* D and
    addressString 0..* D and
    addressContactPoint 0..* D and
    addressExtendedContactDetail 0..* D

* extension[address][addressUrl].value[x] only url
* extension[address][addressString].value[x] only string
* extension[address][addressContactPoint].value[x] only ContactPoint
* extension[address][addressExtendedContactDetail].value[x] only ExtendedContactDetail

* extension[additionalInfoURL] ^short = "Address to see alternative connection details"
* extension[additionalInfoURL].value[x] only url

* extension[maxParticipants] ^short = "Maximum number of participants supported by the virtual service"
* extension[maxParticipants].value[x] only positiveInt

* extension[sessionKey] ^short = "Session Key required by the virtual service"
* extension[sessionKey].value[x] only string