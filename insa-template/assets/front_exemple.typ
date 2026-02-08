#set page(paper: "a4", margin: 0pt)

#let cell-size = 37.1mm
#let margin-x = 10mm
#let margin-y = margin-x
#let page-width = 210mm
#let page-height = 297mm

// Option pour afficher/cacher la grille et les coordonnées
#let show-grid = true

#let grid-width = page-width - 2 * margin-x
#let cols = calc.floor(grid-width / cell-size)
#let grid-width = cols * cell-size

#let available-height = page-height - 2 * margin-y
#let rows = calc.floor(available-height / cell-size)
#let regular-grid-height = rows * cell-size
#let extra-height = available-height - regular-grid-height

#let offset-x = margin-x
#let offset-y = margin-y

// Couleurs
#let principal-color = rgb("#e42618")
#let secondary-color = rgb("#f69f1d")
#let terciary-color = rgb("#f5adaa")
#let quaternary-color = rgb("#f8f0ec")

// ========== MOTIFS DISPONIBLES ==========

// Motif de fond uni
#let fill-pattern(color) = (
  type: "fill",
  color: color,
)

// Motif de lignes verticales
#let lines-pattern(spacing, color, thickness) = (
  type: "lines",
  spacing: spacing,
  color: color,
  thickness: thickness,
)

// Motif de croix
#let cross-pattern(density, color, size, thickness) = (
  type: "cross",
  density: density,
  color: color,
  size: size,
  thickness: thickness,
)

// ========== DÉFINITION DE LA GRILLE ==========

// Structure : "col,row": (col-span, row-span, (pattern1, pattern2, ...))
#let grid-cells = (
  "-1,-1": (5, 6, (fill-pattern(principal-color),)),
  "1,6": (
    1,
    1,
    (
      fill-pattern(terciary-color),
      lines-pattern(1.7 * 2mm, quaternary-color, 0.5pt),
    ),
  ),
  "1,7": (1, 1, (lines-pattern(1.7 * 2mm, quaternary-color, 0.5pt),)),
  "4,4": (
    1,
    1,
    (
      fill-pattern(terciary-color),
      lines-pattern(1.7mm, quaternary-color, 0.5pt),
    ),
  ),
  "4,5": (1, 1, (fill-pattern(terciary-color),)),
  "4,3": (
    1,
    1,
    (
      fill-pattern(quaternary-color),
      // cross-pattern(8, secondary-color, 1.5mm, 0.5pt),
    ),
  ),
  "1,5": (3, 1, (fill-pattern(secondary-color),)),
  "4,6": (1, 2, (fill-pattern(secondary-color),)),
  "3,7": (1, 1, (fill-pattern(secondary-color),)),
  // Cases avec lignes
  "3,3": (1, 3, (lines-pattern(1.7mm, quaternary-color, 0.5pt),)),
  "2,4": (1, 1, (lines-pattern(1.7mm, quaternary-color, 0.5pt),)),
  "0,6": (1, 1, (lines-pattern(1.7mm, quaternary-color, 0.5pt),)),
  // Cases avec croix
  "0,5": (
    1,
    1,
    (
      fill-pattern(terciary-color),
      // cross-pattern(6, principal-color, 1mm, 0.5pt),
    ),
  ),
)

// ========== FONCTIONS UTILITAIRES ==========

#let get-y(row) = {
  if row == 0 { 0pt } else { extra-height + (row - 1) * cell-size }
}

#let get-height(row, span) = {
  if row == 0 {
    extra-height + (span - 1) * cell-size
  } else {
    span * cell-size
  }
}

#let draw-cross(x, y, size, color, thickness) = {
  place(dx: x, dy: y, {
    place(dx: -size, line(length: size * 2, stroke: thickness + color))
    place(dy: -size, line(length: size * 2, angle: 90deg, stroke: thickness + color))
  })
}

// Fonction pour appliquer un motif
#let apply-pattern(pattern, col, row, width, height) = {
  if pattern.type == "fill" {
    rect(width: width, height: height, fill: pattern.color, stroke: none)
  } else if pattern.type == "lines" {
    let num-lines = calc.floor(width / pattern.spacing)
    for i in range(num-lines + 1) {
      place(
        dx: i * pattern.spacing,
        dy: 0pt,
        line(length: height, angle: 90deg, stroke: pattern.thickness + pattern.color),
      )
    }
  } else if pattern.type == "cross" {
    let spacing-x = width / pattern.density
    let spacing-y = height / pattern.density
    let margin-x = spacing-x / 2
    let margin-y = spacing-y / 2

    for i in range(pattern.density) {
      for j in range(pattern.density) {
        draw-cross(
          margin-x + i * spacing-x,
          margin-y + j * spacing-y,
          pattern.size,
          pattern.color,
          pattern.thickness,
        )
      }
    }
  }
}

// ========== RENDU ==========

#place(dx: offset-x, dy: offset-y, {
  // Dessiner toutes les cellules
  for (key, cell) in grid-cells {
    let coords = key.split(",")
    let col = int(coords.at(0))
    let row = int(coords.at(1))
    let (col-span, row-span, patterns) = cell

    let cell-width = col-span * cell-size
    let cell-height = get-height(row, row-span)
    let cell-x = col * cell-size
    let cell-y = get-y(row)

    // Appliquer chaque motif dans l'ordre
    for pattern in patterns {
      place(dx: cell-x, dy: cell-y, {
        apply-pattern(pattern, col, row, cell-width, cell-height)
      })
    }
  }

  // Afficher la grille si activée
  if show-grid {
    place(dy: 0pt, line(length: grid-width, stroke: 0.5pt + black))
    place(dy: extra-height, line(length: grid-width, stroke: 0.5pt + black))

    for row in range(1, rows + 1) {
      place(dy: extra-height + row * cell-size, line(length: grid-width, stroke: 0.5pt + black))
    }

    for col in range(cols + 1) {
      place(dx: col * cell-size, line(length: extra-height + regular-grid-height, angle: 90deg, stroke: 0.5pt + black))
    }

    for col in range(cols) {
      place(dx: col * cell-size + 2pt, dy: 2pt, text(size: 8pt, fill: black, weight: "bold")[#col,0])
    }

    for row in range(1, rows + 1) {
      for col in range(cols) {
        place(
          dx: col * cell-size + 2pt,
          dy: extra-height + (row - 1) * cell-size + 2pt,
          text(size: 8pt, fill: black, weight: "bold")[#col,#row],
        )
      }
    }
  }
})
