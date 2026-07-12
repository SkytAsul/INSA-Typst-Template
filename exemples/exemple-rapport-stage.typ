#import "../src/document-template.typ": *
#set document(date: datetime(year: 2024, month: 08, day: 16), keywords: ("VR", "Physics Simulation", "Soft body"))
#show: doc => insa-stage(
  lang: "fr",
  insa: "rennes",
  confidential: none,
  company-tutor-signature: image("logo-example.png", height: 1.8cm),
  name: "Youenn LE JEUNE", 
  student-lastname: "LE JEUNE",
  student-firstname: "Youenn",
  student-year: "4A",
  student-option: none,
  department: "INFO",
  year: "2023-2024",
  title: "Real-time virtual interaction with deformable structure",
  company-tutor-type: "Entreprise",
  company-tutor: "VENDITELLI Marilena",
  company-tutor-function: "Professeure associée",
  insa-tutor: "COUASNON Bertrand",
  insa-tutor-suffix: "",
  company: "Sapienza University of Rome",
  company-city: "Rome",
  company-dept-country: "Italie",
  company-logo: image("logo-example.png"),
  summary-french:  [
    Résumé du stage en français.
  ],
  summary-english:  [
    Summary of the internship in english.
  ],
  thanks-page: [
    Merci aux clients fidèles.
  ],
  omit-outline: false,
  doc,
)

= Introduction
Présentation de l'entreprise, tout ça tout ça.

#pagebreak()
= Travail réalisé
== Première partie
Blabla, citation : @haug-typst

== Seconde partie
Bleble

#pagebreak()
= Conclusion
Conclusion random

#pagebreak()
#bibliography("bibliography-example.yml")

#pagebreak()
#set heading(numbering: none)
= Annexes
