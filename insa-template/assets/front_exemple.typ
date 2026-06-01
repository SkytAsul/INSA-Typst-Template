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

// ========== SYSTÈME DE GRILLE PAR COUCHES ASCII ==========
//
// La grille est définie visuellement par des couches (layers) superposées,
// rendues de l'arrière vers l'avant. Chaque couche associe une couleur
// à une grille ASCII où chaque caractère représente le motif d'une cellule.
//
// Symboles disponibles :
//   o  = remplissage uni (carré plein)
//   i  = lignes verticales fines (espacement 1.7mm)
//   |  = lignes verticales larges (espacement 3.4mm)
//   +  = motif de croix
//   .  = vide (pas de motif)
//
// ── Débordement dans les marges (bleed) ──
//
// Problème : certains motifs doivent s'étendre dans les marges de la page
// (ex : le bloc rouge en haut à gauche couvre le coin de la page).
//
// Solution : le paramètre `bleed` ajoute des colonnes/rangées
// supplémentaires AU DÉBUT de la grille ASCII. Ces cellules sont rendues
// dans la zone de marge (coordonnées négatives) et clipées par la page.
//
//   bleed.left = 1  →  la 1ère colonne ASCII déborde dans la marge gauche
//   bleed.top  = 1  →  la 1ère rangée ASCII déborde dans la marge supérieure
//
// Taille de la grille ASCII :
//   colonnes = bleed.left + cols + bleed.right
//   rangées  = bleed.top + 1 + rows + bleed.bottom
//                          ↑ rangée 0 (hauteur réduite = extra-height)

#let bleed = (left: 1, top: 1, right: 0, bottom: 0)

// ========== DÉFINITION DES COUCHES (arrière → avant) ==========
//
// Grille : 6 colonnes × 9 rangées
//
//   col ASCII :  0        1–5
//                ↑        ↑
//              bleed    colonnes 0–4 de la grille
//
//   row ASCII :  0        1          2–8
//                ↑        ↑          ↑
//              bleed    rangée 0   rangées 1–7
//                       (courte)

#let layers = (
  // Rouge : grand bloc de fond (haut-gauche, déborde dans les marges)
  (principal-color, "
ooooo.
ooooo.
ooooo.
ooooo.
ooooo.
ooooo.
......
......
......
"),
  // Crème : case de remplissage
  (quaternary-color, "
......
......
......
......
.....o
......
......
......
......
"),
  // Rose clair : cases de remplissage
  (terciary-color, "
......
......
......
......
......
.....o
.o...o
..o...
......
"),
  // Jaune/orange : cases de remplissage
  (secondary-color, "
......
......
......
......
......
......
..ooo.
.....o
....oo
"),
  // Crème : lignes verticales (par-dessus les remplissages)
  (quaternary-color, "
......
......
......
......
....i.
...iii
....i.
.i|...
..|...
"),
)

// ========== FONCTIONS DE POSITIONNEMENT ==========

// Position Y d'une cellule selon sa rangée (coordonnées originales)
#let get-cell-y(row) = {
  if row < 0 { row * cell-size }
  else if row == 0 { 0pt }
  else { extra-height + (row - 1) * cell-size }
}

// Hauteur d'une cellule selon sa rangée
#let get-cell-height(row) = {
  if row == 0 { extra-height }
  else { cell-size }
}

// ========== RENDU DES MOTIFS ==========

#let draw-cross(x, y, size, color, thickness) = {
  place(dx: x, dy: y, {
    place(dx: -size, line(length: size * 2, stroke: thickness + color))
    place(dy: -size, line(length: size * 2, angle: 90deg, stroke: thickness + color))
  })
}

#let render-symbol(symbol, width, height, color) = {
  if symbol == "o" {
    rect(width: width, height: height, fill: color, stroke: none)
  } else if symbol == "i" {
    let spacing = 1.7mm
    let n = calc.floor(width / spacing)
    for k in range(n + 1) {
      place(dx: k * spacing, line(length: height, angle: 90deg, stroke: 0.5pt + color))
    }
  } else if symbol == "|" {
    let spacing = 1.7mm * 2
    let n = calc.floor(width / spacing)
    for k in range(n + 1) {
      place(dx: k * spacing, line(length: height, angle: 90deg, stroke: 0.5pt + color))
    }
  } else if symbol == "+" {
    let density = 6
    let sx = width / density
    let sy = height / density
    for a in range(density) {
      for b in range(density) {
        draw-cross(sx / 2 + a * sx, sy / 2 + b * sy, 1mm, color, 0.5pt)
      }
    }
  }
}

// ========== PARSING DE LA GRILLE ASCII ==========

#let parse-grid(art) = {
  let lines = art.split("\n").filter(l => l.len() > 0)
  let cells = ()
  for (row-idx, grid-line) in lines.enumerate() {
    for (col-idx, ch) in grid-line.clusters().enumerate() {
      if ch != "." and ch != " " {
        cells += ((col: col-idx, row: row-idx, symbol: ch),)
      }
    }
  }
  cells
}

// ========== RENDU PRINCIPAL ==========

#place(dx: offset-x, dy: offset-y, {
  // Rendu des couches (arrière → avant)
  for (color, art) in layers {
    for cell in parse-grid(art) {
      let orig-col = cell.col - bleed.left
      let orig-row = cell.row - bleed.top

      place(
        dx: orig-col * cell-size,
        dy: get-cell-y(orig-row),
        render-symbol(cell.symbol, cell-size, get-cell-height(orig-row), color),
      )
    }
  }

  // Grille de débogage
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
