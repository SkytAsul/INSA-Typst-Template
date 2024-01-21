#import "insa-template/template.typ" : *
#show: doc => insa(
  cover-header: [
    NOM Prénom

    Département INFO\
    (les meilleurs)
  ],
  cover-title: "Document important",
  page-header: "En-tête au pif",
  doc
)

Template avec la page de garde mais pas de formattage précis pour l'écriture (pas de règles de numérotation des paragraphes incluse, etc.).
#set heading(numbering: "1.a  ")
= Partie 1
Allo
== Partie 2
Petite équation (sans numérotation) :
$ (a+b)^2 = sum_(i=0)^n C^k_n a^i b^(n-i) $