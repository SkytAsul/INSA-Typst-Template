#import "../insa-template/portfolio-template.typ" as portfolio

#show: portfolio.setup.with(
  // maybe some parameters in the future?
)

#portfolio.proof(
  trace-name: "Projet 4A : FlutterInk",
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

#portfolio.proof(
  trace-name: "Stage: InfluxDB vers ClickHouse",
  trace-content: [
    voir rapport de stage
  ],
  trace-comments: [
    Travail principal effectué durant mon stage d'été de 4A chez Purecontrol.

    Il s'est fait en 3 grosses phases :
    - étudier les alternatives à InfluxDB et concevoir un schéma de BDD adapté
    - prévoir le processus de migration sans interrompre le fonctionnement de l'entreprise
    - développer un outil de traduction de requêtes
  ],
  associated-teaching: [
    - Compilation + Grammaire et Langages
      - Écriture d'un parser pour le langage InfluxQL en Python (syntaxe proche du BNF)
    - CPOO/CPOO2
      - Patrons de conception
      - Tests unitaires & tests d'intégration
    - BDD
      - Design d'un schéma de BDD relationnelle
    - Programmation Parallèle
      - Multithreading du système de traduction
  ],
  skills: (
    "CONCV-2", "CONCV-4", "CONCV-5",
    "IMPLEM-1", "IMPLEM-2", "IMPLEM-3", "IMPLEM-4",
    "EXPLT-1", "EXPLT-3",
    "CONDUC-3", "CONDUC-4", "CONDUC-5", "CONDUC-6",
    "ANTICP-0",
  ),
  comments: [
    Impression très nette d'utiliser ce qu'on a appris en cours, ce qui est rare et plaisant (notamment lors de l'écriture du parseur, je ne pensais pas avoir à utiliser mon cours de Grammaire et Langages un jour).
  ]
)

/*#portfolio.proof(
  trace-name: "Projet Logiciel : Ansible Analytics",
  trace-content: [
    #link("https://reset.inso-world.com/repo/2025ws-ase-pr-group/25ws-ase-pr-qse-09/")
  ],
  trace-comments: [
    Projet durant mon semestre de mobilité à la TU Wien.

    WIP
  ],
  associated-teaching: [
  ],
  skills: (
  ),
  comments: [
  ]
)*/

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