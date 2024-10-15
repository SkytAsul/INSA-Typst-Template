#import "../insa-template/slides-template.typ" : *

#show: insa-slides.with(
  title: "Slides de fou",
  subtitle: "Faites avec amour parce que je suis un giga bébou et non c'est pas cringe le mot bébou (si ça l'est en fait)"
)

= Section pas très intéressante

== Petit titre de slide

Incroyable
- Liste
  - dans
    - une liste

On peut aussi faire un #text(fill: insa-colors.secondary)[texte] avec les #text(fill: insa-colors.primary)[couleurs de l'INSA] !


#title-slide(title: "Surprise !", subtitle: "Eh oui, on peut aussi insérer une autre page de titre (mais bon, pour quoi faire)", title-visual: image("../illustrations/github-download.png"))

== AnotherSub

Du texte

#pause

Et un autre texte qui apparaît plus tard !

#section-slide[Coucou c'est moi][On peut mettre des descriptions aussi !]

kk