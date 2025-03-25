Extension:    VirtualServiceDetailExt
Id:           virtual-service-detail
Title:        "VirtualServiceDetail"
Description:  "Represents personalized details for a virtual service. This extension is meant to be used on appointment.participant if personalized Details (e.g. individual links or secrets) per participant exist. If the details are the same for all participants, Appointment.virtualService should be used instead"
Context: Appointment.participant

// Does not work - fails with Sushi error The type "VirtualServiceDetail" does not match any of the allowed types: base64Binary or boolean or Canonical() or code or date or dateTime or decimal or id or instant or integer or integer64 or markdown or oid or positiveInt or string or time or unsignedInt or uri or url or uuid or Address or Age or Annotation or Attachment or CodeableConcept or CodeableReference() or Coding or ContactPoint or Count or Distance or Duration or HumanName or Identifier or Money or Period or Quantity or Range or Ratio or RatioRange or Reference() or SampledData or Signature or Timing or ContactDetail or DataRequirement or Expression or ParameterDefinition or RelatedArtifact or TriggerDefinition or UsageContext or Availability or ExtendedContactDetail or Dosage or Meta (00:00.347 / 00:05.153, 22Mb)
// There is no valueVirtualServiceDetail on https://www.hl7.org/fhir/extensibility.html#extension so likely it is not usable
* value[x] only VirtualServiceDetail
