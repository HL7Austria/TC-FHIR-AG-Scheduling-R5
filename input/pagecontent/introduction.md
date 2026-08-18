### Introduction

This FHIR Implementation Guide (IG) provides a structured framework for software vendors that aim to offer online appointment booking solutions in Austria. It supports multiple booking scenarios, including the [central scheduling platform](use-case-central-scheduling-platform.html) model and [simple appointment booking](use-case-simple-appointment-booking.html).

This guide leverages the FHIR Resources [Schedule](https://www.hl7.org/fhir/schedule.html) and [Slot](https://www.hl7.org/fhir/slot.html) for appointment booking. Additionally, it introduces operations for searching for healthcare service providers and for temporarily reserving bookable slots. Furthermore, this guide extends support to virtual appointments, including video consultations, enabling healthcare providers to seamlessly integrate them into the booking process.

This version, 0.2.0 - Informative, is still in its early stage and serves as a reference point for software vendors. The goal is to help vendors verify whether their use cases are sufficiently supported within this framework, fostering interoperability and streamlined appointment scheduling processes across healthcare systems.

### Background

This implementation guide is inspired by the [ISiK Modul "Terminplanung"](https://simplifier.net/isik-terminplanung-v4/~introduction) and [IHE Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) implementation guides, adapting their concepts to the Austrian context.
