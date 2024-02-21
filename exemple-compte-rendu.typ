#import "insa-template/template.typ" : *
#show: doc => report(
  id: 3,
  pre-title: "STPI X",
  title: "Interférences et diffraction",
  authors: ("NOM1 Prénom1", "NOM2 Prénom2"),
  sub-authors: [
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
- les blocs de code sont automatiquement entourés d'un trait

= Théorie blabla
== Sous-partie 1

Une petite équation:
$ (lambda D) / (n pi) = "truc au pif" $
// petit commentaire

Des maths sur la même ligne: $a b = sqrt(b a)$

Maintenant voici du contenu:

#tableau(/*tableau ici*/"texte à la place", caption: "Random tablelau au pif")

#figure(/*image ici*/"texte à la place", caption: "Random image ua pif")

=== Un bloc de code en Java
```java
public class ClasseDeMerde {

  public static void main(String[] args) {
    System.out.println("uwu");
  }

}
```