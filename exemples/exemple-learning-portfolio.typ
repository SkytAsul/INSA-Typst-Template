#import "../insa-template/portfolio-template.typ" as portfolio

#show: portfolio.setup.with(
  // maybe some parameters in the future?
)

#portfolio.proof(
  trace-name: "Projet 4 INFO : FlutterInk",
  trace-content: [
    #link("https://gitlab.insa-rennes.fr/intuinote/flutterink")

    // image ?
  ],
  trace-comments: [
    Ce projet est un travail continu sur toute ma 4e année d'études.

    Il a demandé 2 grands types de travail :
    - la gestion de projet, pour produire des rapports et des soutenances
    - le développement d'une application

    L'étape la plus significative pour moi a été la première fois que l'application a eu une forme utilisable, après des mois de travail.
  ],
  associated-teaching: [
    - Programmation Mobile
      - Design d'interfaces graphiques pour appareils mobiles
    - CPOO/CPOO2
      - Patrons de conceptions communs
  ],
  skills: (
    "CONDUC-0",
    "CONDUC-1",
    "CONDUC-3",
    "CONDUC-4",
    "CONDUC-6",
    "CONCV-0",
    "CONCV-2",
    "CONCV-5",
    "IMPLEM-1",
    "IMPLEM-3",
    "IMPLEM-4"
  ),
  comments: [
    Difficulté à répartir la charge de travail entre les membres du groupe, un des membres travaillait nettement moins.
    - *Solution :* se concerter avec les autres membres du groupe pour se répartir le travail entre nous.
    - *À l'avenir :* en parler le plus vite possible avec la personne concernée. Si je suis amené à faire de la gestion de projet, c'est important à savoir gérer.

    Préoccupation importante : finir toutes les fonctionnalités demandées dans les temps.
  ]
)

#portfolio.proof(
  trace-name: "Powermeter logiciel",
  trace-comments: [
    Afin de mettre en évidence la consommation d'énergie de nos machines, et plus particulièrement des logiciels et algorithmes qui tournent dessus, nous avons développé un watt-mètre logiciel.
  ],
  associated-teaching: [
    - Green Computing
      - Concepts derrière la mesure d'énergie logicielle (RAPL)
    - LDS
      - Programmation en Python
  ],
  skills: (
    "CONCV-4",
  ),
  comments: [
    Même une solution un peu expérimentale donne des résultats intéressants qui peuvent être développés par la suite. Expérience utile en R&D mais aussi en prototypage dans le métier d'ingénieur.
  ]
)

// A blueprint to copy-paste and then fill with your data
#portfolio.proof(
  trace-name: "Titre",
  trace-content: [
  ],
  trace-comments: [
  ],
  associated-teaching: [
  ],
  skills: (
  ),
  comments: [
  ]
)