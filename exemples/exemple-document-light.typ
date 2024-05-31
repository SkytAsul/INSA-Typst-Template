#import "../insa-template/document-template.typ" : *
#show: doc => insa-document(
  "light",
  cover-top-left: [*Document important* de type très important],
  cover-middle-left: [
    NOM Prénom

    Département INFO\
    (les meilleurs)
  ],
  cover-bottom-right: "uwu",
  page-header: "En-tête au pif",
  doc
)

Template avec la page de garde mais pas de formattage précis pour l'écriture (pas de règles de numérotation des paragraphes incluse, etc.).
#set heading(numbering: "1.1")
= Partie 1
Allo
== Sous-partie 1
Petite équation (sans numérotation) :
$ (a+b)^n = sum_(i=0)^n C^i_n a^i b^(n-i) $