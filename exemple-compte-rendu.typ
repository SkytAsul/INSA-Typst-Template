#import "insa-template/template.typ" : *
#show: doc => compte-rendu(
  numéro: 3,
  preTitre: "STPI X",
  titre: "Interférences et diffraction",
  auteurs: ("NOM1 Prénom1", "NOM2 Prénom2"),
  auteursSous: [
    STPI XX\
    Binôme X
  ],
  date: "11/04/2023",
  doc)

Template fait pour des comptes-rendus (notamment ceux de STPI) :
- règles de numérotation incluse
- équations numérotées aussi
- paragraphes justifiés
- premiers titres en lettres capitales
- présence de la fonction `#tableau` pour faire des figures nommées "Tableau" facilement

= Théorie blabla
== Sous-partie 1

Une petite équation:
$ (lambda D) / (n pi) = "truc au pif" $
// petit commentaire

Des maths sur la même ligne: $a b = sqrt(b a)$

Maintenant voici du contenu:

#tableau(/*tableau ici*/"texte à la place", caption: "Random tablelau au pif")

#figure(/*image ici*/"texte à la place", caption: "Random image ua pif")