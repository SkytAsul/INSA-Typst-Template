#import "../insa-template/letter-template.typ" : insa-letter
#show: doc => insa-letter(
  author: [
    Youenn LE JEUNE\
    3 INFO G2.1
  ],
  insa: "rennes",
  doc
)

Document INSA sans page de garde mais avec le logo en en-tête partout.\
Pas de règles de numérotation, équations, etc. incluses.

La numérotation en bas à droite s'affiche uniquement si il y a plus d'une page.

= Coucou

FF "ceci est entre guillemets"

$ VV(X) = 1/n sum_(i=1)^n (x_i - overline(x))^2 $
