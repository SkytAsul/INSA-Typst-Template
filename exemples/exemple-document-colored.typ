#import "../insa-template/document-template.typ" : *
#show: doc => insa-document(
  "colored",
  cover-top-left: [*Document important* de type très important],
  page-header: none, // va utiliser par défaut le logo INSA
  doc
)

Template avec la page de garde mais pas de formattage précis pour l'écriture (pas de règles de numérotation des paragraphes incluse, etc.).
#set heading(numbering: "1.a  ")
= Partie 1
Allo
== Partie 2
Petite équation (sans numérotation) :
$ (a+b)^n = sum_(i=0)^n C^i_n a^i b^(n-i) $