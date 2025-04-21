#import "../insa-template/document-template.typ" : *
#set document(date: datetime(year: 2024, month: 08, day: 16), keywords: ("VR", "Physics Simulation", "Soft body"))
#show: doc => insa-pfe(
  "Youenn LE JEUNE",
  "INFO",
  "2023-2024",
  "Real-time virtual interaction with deformable structure",
  "Sapienza University of Rome",
  image("logo-example.png"),
  "Marilena VENDITELLI",
  "Bertrand COUASNON",
  [
    Résumé du PFE en français.
  ],
  [
    Summary of the EOS project in english.
  ],
  thanks-page: [
    Merci aux clients fidèles.
  ],
  student-suffix: "(e)",
  lang: "fr",
  insa: "rennes",
  doc
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
