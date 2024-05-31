#let heading-fonts = ("League Spartan", "Arial", "Liberation Sans")
#let normal-fonts = ("Source Serif", "Source Serif 4", "Georgia")
#let insa-document(
  cover-type,
  cover-top-left: [],
  cover-middle-left: [],
  cover-bottom-right: [],
  page-header: none,
  page-footer: none,
  include-back-cover: true,
  doc
) = {
  set text(lang: "fr", font: heading-fonts)
  set page("a4", margin: 0cm)

  set par(justify: false) // only for the cover

  let back-cover-asset

  if cover-type == "light" {
    back-cover-asset = "assets/back-cover2.jpeg"

    // image
    place(image("assets/front-cover1.jpeg"))

    // top-left
    place(
      dx: 2.5cm,
      dy: 6.5cm,
      block(
        width: 9.5cm,
        text(size: 18pt, cover-top-left)
      )
    )

    // middle-left
    place(
      dx: 2.5cm,
      dy: 13.7cm,
      block(
        width: 6.5cm,
        height: 7cm,
        align(horizon, text(size: 16pt, cover-middle-left))
      )
    )

    // bottom-right
    place(
      dx: 9.5cm,
      dy: 25.5cm,
      box(
        width: 8.5cm,
        text(size: 24pt, cover-bottom-right)
      )
    )

  } else if cover-type == "colored" {
    back-cover-asset = "assets/back-cover2.jpeg"

    // image
    place(image("assets/front-cover3.jpeg"))

    // top-left
    place(
      dx: 2.5cm,
      dy: 7.5cm,
      block(
        width: 9.5cm,
        text(size: 20pt, fill: white, cover-top-left)
      )
    )

    if cover-middle-left != [] {
      panic("cover-middle-left has content but is incompatible with this cover-type")
    }
    if cover-bottom-right != [] {
      panic("cover-bottom-right has content but is incompatible with this cover-type")
    }

  } else if cover-type == "pfe" {
    back-cover-asset = "assets/back-cover1.png"

    // image
    place(image("assets/front-cover2.png"))

    // top-left
    place(
      dx: 2.5cm,
      dy: 6.5cm,
      block(
        width: 9.5cm,
        text(size: 18pt, cover-top-left)
      )
    )

    // middle-left
    place(
      dx: 2.5cm,
      dy: 13.7cm,
      block(
        width: 9.5cm,
        height: 14cm,
        align(horizon, text(size: 16pt, cover-middle-left))
      )
    )

    // bottom-right
    place(
      dx: 12.3cm,
      dy: 25.5cm,
      box(
        width: 7.5cm,
        text(size: 20pt, cover-bottom-right)
      )
    )

  } else {
    panic("Unknown cover-type: only 'light', 'colored' and 'pfe' available.")
  }

  
  counter(page).update(0)
  set page(
    "a4",
    margin: (x: 1.75cm, y: 2.5cm),
    footer: context {
      place(
        right + bottom,
        dx: page.margin.at("right") - 0.6cm,
        dy: -0.6cm,
        box(width: 2.34cm, height: 2.34cm, image("assets/footer.png"))
      )
      place(
        right + bottom,
        dx: page.margin.at("right") - 0.6cm,
        dy: -0.6cm,
        box(width: 1.15cm, height: 1.15cm, align(center + horizon, text(fill: white, weight: "bold", counter(page).display())))
      )
      page-footer
    },
    header: {
      if page-header == none {
        image("assets/logo.png", width: 4.68cm)
      } else if page-header != [] {
        page-header
        line(length: 100%)
      }
    }
  )
  show heading: set text(font: heading-fonts, weight: "bold")
  set text(font: normal-fonts, weight: "regular")
  set par(justify: true, first-line-indent: 1em)
  set figure(numbering: "1")
  set outline(indent: auto)
  show figure.where(kind: image): set figure(supplement: "Figure") // par défaut, Typst affiche "Fig."
  show figure.caption: it => [
    #text(weight: "bold")[
      #it.supplement
      #context it.counter.display(it.numbering) :
    ]
    #it.body
  ]
  
  doc

  if (include-back-cover) {
    page(footer: none, header: none, margin: 0cm, image(back-cover-asset))
  }
}


// REPORT DOCUMENT:

#let insa-report(
  id: 1,
  pre-title: none,
  title : none,
  authors: [],
  date: none,
  doc,
) = insa-document(
  "light",
  cover-middle-left: authors,
  cover-top-left: [
    #set text(size: 28pt, weight: "bold")
    #if pre-title != none [
      #pre-title #sym.hyph
    ]
    TP #id\
    #set text(size: 22pt, weight: "medium")
    #smallcaps(title)
  ],
  page-header: [
    TP #id #sym.hyph #smallcaps(title)
    #h(1fr)
    #if type(date) == datetime {
      date.display("[day]/[month]/[year]")
     } else {
      date
     }
  ],
  include-back-cover: false,
  {
    set math.equation(numbering: "(1)")
    set text(hyphenate: false)
    set heading(numbering: "I.1.")
    set par(first-line-indent: 0em)
    show heading.where(level: 1): it => {
      set text(18pt)
      upper(it)
      // Do not use the `smallcaps` function until Typst implements a fallback in the case the font does not provide smcp capability.
    }
    show raw.where(block: true): it => block(stroke: 0.5pt + black, inset: 5pt, width: 100%, it)
    show raw.line: it => if it.count > 1{
      text(fill: luma(150), str(it.number)) + h(2em) + it.body
    } else {it}
    doc
  }
)


// STAGE DOCUMENT:


