#import "../insa-template/document-template.typ" : *
#show: doc => insa-document(
  "pfe",
  cover-top-left: [*Document important*\ de type très important],
  cover-middle-left: [
    NOM Prénom

    Département INFO\
    (les meilleurs)
  ],
  cover-bottom-right: "uwu",
  page-header: none, // va utiliser par défaut le logo INSA
  page-footer: [
    Un petit pied de page ?
  ],
  include-back-cover: true,
  doc
)

Template avec la page de garde mais pas de formattage précis pour l'écriture (pas de règles de numérotation des paragraphes incluse, etc.).
= Partie 1
Allo
== Partie 2
Petite équation (sans numérotation) :
$ (a+b)^n = sum_(i=0)^n C^i_n a^i b^(n-i) $

#outline(indent: auto)