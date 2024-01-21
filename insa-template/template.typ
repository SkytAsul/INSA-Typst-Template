#let insa(
  cover-header: [],
  cover-title: [],
  page-header: [],
  date: datetime.today(),
  doc
) = {
  set text(lang: "fr")
  set page("a4")

  place(image("cover.jpg"))
  place(
    dx: 2cm,
    dy: 5cm,
    par(
      leading: 15pt,
      text(size: 14pt, cover-header)
    )
  )
  place(
    dx: 8cm,
    dy: 20cm,
    box(
      width: 8.5cm,
      par(
        leading: 15pt,
        justify: false,
        text(size: 24pt, weight: "bold", cover-title)
      )
    )
  )
  
  counter(page).update(0)
  set page(
    "a4",
    header-ascent: 25%,
    footer: [
      #place(
        right,
        dy: -0.6cm,
        dx: 1.9cm,
        image("footer.png")
      )
      #place(
        right,
        dx: 1.55cm,
        dy: 0.58cm,
        text(fill: white, weight: "bold", counter(page).display())
      )
    ],
    header: [
      #page-header
      #h(1fr)
      #if type(date) == datetime [
        #date.display("[day]/[month]/[year]")
      ] else [
        #date
      ]
      #line(length: 100%)
    ]
  )
  
  doc
}

#let insa-short(
  author : none,
  date : datetime.today(),
  doc
) = {
  set text(lang: "fr")
  set page(
    "a4",
    margin: (top: 3.2cm),
    header-ascent: 0.71cm,
    header: [
      #place(left, image("logo.png", height: 1.28cm), dy: 1.25cm)
      #place(right + bottom)[
        #author\
        #if type(date) == datetime [
          #date.display("[day]/[month]/[year]")
        ] else [
          #date
        ]
      ]
    ],
    footer: [
      #place(
        right,
        dy: -0.6cm,
        dx: 1.9cm,
        image("footer.png")
      )
      #place(
        right,
        dx: 1.55cm,
        dy: 0.58cm,
        text(fill: white, weight: "bold", counter(page).display())
      )
    ]
  )

  doc
}

#let compte-rendu(
  numéro: 0,
  preTitre: none,
  titre: none,
  auteurs: (),
  auteursSous: none,
  date: none,
  doc,
) = {
  insa(
    cover-header: [
      #auteurs.map(auteur => [
        #text(
          weight: "bold",
          auteur
        )
      ]).join(linebreak())\
      #auteursSous
    ],
    cover-title: [
      #set text(size: 28pt, weight: "bold")
      #if preTitre != none [
        #preTitre #sym.hyph
      ]
      TP #numéro\
      #set text(size: 22pt, weight: "medium")
      #smallcaps(titre)
    ],
    page-header: [TP #numéro #sym.hyph #smallcaps(titre)],
    date: date,
    {
      set math.equation(numbering: "(1)")
      set par(justify: true)
      set text(hyphenate: false)
      set heading(numbering: "1.")
      show heading.where(level: 1): it => [
        #set text(18pt)
        #smallcaps(it)
      ]
      doc
    }
  )
}

#let tableau(content, caption: none) = {
  figure(caption: caption, kind: "table", supplement: "Tableau", content)
}