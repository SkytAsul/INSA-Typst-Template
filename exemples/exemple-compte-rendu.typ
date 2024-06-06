#import "../insa-template/document-template.typ" : *
#show: doc => insa-report(
  id: 3,
  pre-title: "STPI X",
  title: "Interférences et diffraction",
  authors: [
    *NOM 1 Prénom 1*

    *NOM 2 Prénom 2*
    
    Binôme X
  ],
  date: datetime.today(),
  doc)

Template fait pour des comptes-rendus (notamment ceux de STPI) :
- règles de numérotation des titres incluses
- équations numérotées aussi
- paragraphes justifiés
- premiers titres en lettres capitales
- les blocs de code sont automatiquement entourés d'un trait et contiennent des numéros de ligne

= Théorie blabla
== Sous-partie 1

Une petite équation:
$ (lambda D) / (n pi) = "truc au pif" $
// petit commentaire

Des maths sur la même ligne: $a b = sqrt(b a)$

Maintenant voici du contenu:

#figure(table(
  columns: 2,
  [*Colonne 1*], [*Colonne 2*],
  "quelque chose", "une autre chose",
  "tralalala", "skibidi"
), caption: "Random tableau au pif")

#figure(image("../illustrations/github-download.png", width: 50%), caption: "Une image random")

=== Un bloc de code en Java
```java
public class ClasseJava {

  public static void main(String[] args) {
    System.out.println("uwu");
  }

}
```