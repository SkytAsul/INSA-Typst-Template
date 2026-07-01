#let pdf-pages-grid(columns, rows, pages-list) = page(
  width: 500pt,
  height: auto,
  fill: none,
  margin: 0pt,
  grid(
    gutter: 10pt,
    columns: (1fr,) * columns,
    rows: (auto,) * rows,
    ..pages-list
      .pairs()
      .map(((path, page-list)) => page-list.map(page => box(fill: white, image(path, page: page, fit: "contain"))))
      .flatten()
  ),
)

#document(
  "silky-letter-insa/thumbnail.png",
  pdf-pages-grid(1, 1, (
    "../exemples/exemple-lettre-insa.pdf": (1,),
  )),
)

#document(
  "silky-report-insa/thumbnail.png",
  pdf-pages-grid(1, 1, (
    "../exemples/exemple-compte-rendu.pdf": (1,),
  )),
)

#document(
  "silky-report-insa/thumbnail-insa-document.png",
  pdf-pages-grid(3, 1, (
    "../exemples/exemple-document-colored.pdf": (1,),
    "../exemples/exemple-document-light.pdf": (1, 3),
  )),
)

#document(
  "silky-report-insa/thumbnail-insa-report.png",
  pdf-pages-grid(2, 1, (
    "../exemples/exemple-compte-rendu.pdf": (1, 2),
  )),
)

#document(
  "silky-report-insa/thumbnail-insa-stage.png",
  pdf-pages-grid(3, 1, (
    "../exemples/exemple-rapport-stage.pdf": (1, 3, 9),
  )),
)

#document(
  "silky-slides-insa/thumbnail.png",
  pdf-pages-grid(1, 1, (
    "../exemples/exemple-slides.pdf": (1,),
  )),
)

#document(
  "silky-slides-insa/thumbnail-full.png",
  pdf-pages-grid(2, 2, (
    "../exemples/exemple-slides.pdf": (1, 3, 5, 9),
  )),
)
