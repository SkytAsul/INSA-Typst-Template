# INSA - Typst Template
Typst Template for full documents and reports for the french engineering school INSA.

# Table of contents
1. [Examples & Usage](#examples)
2. [Fonts information](#fonts)
3. [Notes](#notes)
4. [License](#license)

# Examples
TODO insert example with two pages side-by-side on each type
## 🧪 "TP" report

By default, the template initializes with the `insa-report` show rule, with parameters that you must fill in by yourself.

Here is an example of filled template:
```typst
#import "@preview/silky-report-insa:{{VERSION}}": *
#show: doc => insa-report(
  id: 3,
  pre-title: "STPI 2",
  title: "Interférences et diffraction",
  authors: [
    *LE JEUNE Youenn*

    *MAUVY Eva*
    
    Groupe D

    Binôme 5
  ],
  date: "11/04/2023",
  doc)

= Introduction
Le but de ce TP est d’interpréter les figures de diffraction observées avec différents objets diffractants
et d’en déduire les dimensions de ces objets.

= Partie théorique - Phénomène d'interférence
== Diffraction par une fente double
Lors du passage de la lumière par une fente double de largeur $a$ et de distance $b$ entre les centres
des fentes...
```

## 📚 Internship report
If you want to make an internship report, you will need to use another show rule: `insa-stage`.

Here is an example :
```typst
#import "@preview/silky-report-insa:{{VERSION}}": *
#show: doc => insa-stage(
  "Youenn LE JEUNE",
  "INFO",
  "2023-2024",
  "Real-time virtual interaction with deformable structure",
  "Sapienza University of Rome",
  image("logo-example.png"),
  "Marilena VENDITELLI",
  "Bertrand COUASNON",
  [
    Résumé du stage en français.
  ],
  [
    Summary of the internship in english.
  ],
  lang: "fr",
  doc
)

= Introduction
Présentation de l'entreprise, tout ça tout ça.

#pagebreak()
= Travail réalisé
== Première partie
Blabla

== Seconde partie
Bleble

#pagebreak()
= Conclusion
Conclusion random

#pagebreak()
= Annexes
```

This template can also be used for a report that is written in english: in this case, add the `lang: "en"` parameter to the function call in the show rule.

## 🗒️ Blank templates
If you do not want the preformatted output with "TP x", the title and date in the header, etc. you can simply use the `insa-document` show rule and customize all by yourself.

### Blank template types
The graphic charter provides 3 different document types, that are translated in this Typst template under those names:
- **`light`**, which does not have many color and can be printed easily. Has 3 spots to write on the cover: `cover-top-left`, `cover-middle-left` and `cover-bottom-right`.
- **`colored`**, which is beautiful but consumes a lot of ink to print. Only has 1 spot to write on the cover: `cover-top-left`.
- **`pfe`**, which is primarily used for internship reports. Has 4 spots to write on both the front and back covers: `cover-top-left`, `cover-middle-left`, `cover-bottom-right` and `back-cover`.

The document type must be the first argument of the `insa-document` function.

Here is an example:
```typst
#import "@preview/silky-report-insa:{{VERSION}}": *
#show: doc => insa-document(
  "light",
  cover-top-left: [*Document important*],
  cover-middle-left: [
    NOM Prénom

    Département INFO
  ],
  cover-bottom-right: "uwu",
  page-header: "En-tête au pif",
  doc
)
```

# Fonts
The graphic charter recommends the fonts **League Spartan** for headings and **Source Serif** for regular text. To have the best look, you should install those fonts.

> You can download the fonts from [here](https://github.com/SkytAsul/INSA-Typst-Template/tree/main/fonts).

To behave correctly on computers lacking those specific fonts, this template will automatically fallback to similar ones:
- **League Spartan** -> **Arial** (approved by INSA's graphic charter, by default in Windows) -> **Liberation Sans** (by default in most Linux)
- **Source Serif** -> **Source Serif 4** (downloadable for free) -> **Georgia** (approved by the graphic charter) -> **Linux Libertine** (default Typst font)

## Note on variable fonts
If you want to install those fonts on your computer, Typst might not recognize them if you install their _Variable_ versions. You should install the static versions (**League Spartan Bold** and most versions of **Source Serif**).

Keep an eye on [the issue in Typst bug tracker](https://github.com/typst/typst/issues/185) to see when variable fonts will be used!

# Notes
This template is being developed by Youenn LE JEUNE from the INSA de Rennes in [this repository](https://github.com/SkytAsul/INSA-Typst-Template).

For now it includes assets from the INSA de Rennes graphic charter, but users from other INSAs can open an issue on the repository with the correct assets for their INSA.

If you have any other feature request, open an issue on the repository as well.

# License
The typst template is licensed under the [MIT license](https://github.com/SkytAsul/INSA-Typst-Template/blob/main/LICENSE). This does *not* apply to the image assets. Those image files are property of Groupe INSA and INSA Rennes.