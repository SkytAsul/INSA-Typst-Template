#import "insa-common.typ": *

/// A dictionary that contains all skills and criteria
#let _all-skills = (
  "CONCV": (
    name: "Concevoir",
    description: "Concevoir l'architecture d'un système informatique complexe",
    criteria: (
      "En déterminant les spécifications fonctionnelles en fonction d'un besoin utilisateur exprimé",
      "En intégrant les enjeux réglementaires, d'inclusion, socio-économique, éthiques et environnementaux",
      "En appliquant les méthodes adaptées aux contraintes",
      "En analysant les risques et en identifiant les mesures de sécurité à mettre en oeuvre",
      "En optimisant les performances du système en termes d'espace, de temps et d'énergie",
      "En structurant la donnée de manière à faciliter son utilisation"
    )
  ),
  "IMPLEM": (
    name: "Implémenter",
    description: "Implémenter un système informatique complexe",
    criteria: (
      "En optimisant les performances du système à partir des indicateurs de qualité liés aux spécifications",
      "En utilisant les technologies de développement adaptées à l'application visée",
      "En mettant en œuvre les méthodes de vérification les plus pertinentes",
      "En réalisant la documentation du système à des fins de maintenance et d'utilisation",
      "En vérifiant l'adéquation du système avec les besoins et capacités des utilisateurs"
    )
  ),
  "EXPLT": (
    name: "Exploiter",
    description: "Exploiter un système informatique complexe",
    criteria: (
      "En maîtrisant les risques et la qualité",
      "En automatisant le déploiement en fonction de l'infrastructure et du domaine d'application visé",
      "En assurant la maintenance du système informatique pendant son exploitation",
      "En assurant la surveillance du système afin d'anticiper les risques",
      "En intégrant les évolutions des besoins et de l'environnement"
    )
  ),
  "CONDUC": (
    name: "Conduire",
    description: "Conduire un projet informatique dans un environnement coopératif", // à valider
    criteria: (
      "En utilisant les méthodes et outils de gestion et planification de projet adéquats",
      "En choisissant les méthodes et outils adaptés à un contexte international et multiculturel",
      "En valorisant et protégeant des innnovations", // à préciser
      "En intégrant les codes de savoir être en entreprise", // en rouge ???
      "En communiquant dans un groupe de travail",
      "En contribuant à la diffusion d'une culture de veille au sein de son équipe ou de son organisation",
      "En communicant de façon fluide, documentée et adaptée au contexte, à l'écrit et l'oral, sur les propriétés du système"
    )
  ),
  "ANTICP": (
    name: "Anticiper",
    description: "Anticiper les évolutions de son domaine d'application", // à valider
    criteria: (
      "En assurant la veille technologique et scientifique",
      "En connaissant les acteurs clés en industrie et en recherche du domaine",
      "En réfléchissant sur les impacts étiques et sociétaux des systèmes et innovations",
      "En intégrant les innovations pertinentes dans sa pratique"
    )
  ),
)

/// Finds a criterion from its string identifier.
/// 
/// The returned value is a pair with its first value being the key of the
/// skill and the second is the index of the criterion.
/// 
/// If either the skill or the criterion does not exist, an error is raised.
///
/// - crit-id (str): identifier of the criterion, in the format `<skill-id>-<index>`
/// -> array
#let _find-criterion(crit-id) = {
  let match = crit-id.match(regex("^(\w+)-(\d+)$"))

  assert.ne(match, none, message: "Criterion has wrong format")
  assert.eq(match.captures.len(), 2, message: "Criterion has wrong format")

  let (skill-key, i) = match.captures

  let skill = _all-skills.at(skill-key, default: none)
  assert.ne(skill, none, message: "Cannot find a matching skill")

  i = int(i)
  assert(i >= 0 and i < skill.criteria.len(), message: "Cannot find the criterion")

  return (skill-key, i)
}

#let _get-criterion-proofs(crit-id) = context {
  let matching-metadata-list = query(metadata).filter(m => type(m.value) == dictionary and m.value.at("type", default: none) == "proof" and m.value.skills.contains(crit-id))
  
  for metadata in matching-metadata-list {
    let proof-heading = query(selector(heading).before(metadata.location())).last()
    list.item(link(proof-heading.location(), text(fill: insa-colors.primary, metadata.value.name)))
  }
}

#let _get-criterion-id(skill-key, crit-index) = skill-key + "-" + str(crit-index)

#let _skills-table-header(..cells) = table.header(..cells.pos().map(cell => align(center, text(weight: "bold", size: 1.1em, cell))))
#let _skills-table = table(
  columns: (auto, auto, auto, 25%),
  fill: (x, y) => if y == 0 or x == 0 { insa-colors.tertiary.lighten(40%) } else { none },
  inset: (x, y) => if y == 0 or x == 0 { 8pt } else { 5pt },
  _skills-table-header[Compétence][Identifiant][Critère][Utilisation],
  .._all-skills.pairs().map(((key, skill)) => (
    // skill header
    table.cell(rowspan: skill.criteria.len() + 1, breakable: false, align: horizon + center, text(size: 1.1em, weight: "bold", skill.name)),
    table.cell(colspan: 3, align: center, fill: insa-colors.secondary.lighten(75%),text(weight: "bold", skill.description)),
    // criteria
    ..skill.criteria.enumerate().map(((i, crit)) => {
      let crit-id = _get-criterion-id(key, i)
      return (
        table.cell(align: center, fill: insa-colors.secondary.lighten(75%), raw(crit-id)),
        [#crit #label(crit-id)],
        _get-criterion-proofs(crit-id)
      )
    })
  )).flatten(),
)

#let _hline = line(length: 100%, stroke: insa-colors.primary + 0.75pt)

/// The functions that setups the document for a learning portfolio.
/// 
/// You should call it this way, at the very beginning of your file:
/// ```typ
/// #import "template.typ" as portfolio
/// #show: portfolio.setup
/// ```
///
/// - doc (content): the whole document
/// -> content
#let setup(doc) = {
  set page("a4", flipped: true, margin: 1cm)
  set text(lang: "fr", font: insa-body-fonts)
  
  show link: it => {
    // we only color the links that lead outside the document
    if type(it.dest) == str {
      set text(fill: blue)
      underline(offset: .12em, it)
    } else {
      it
    }
  }

  set list(marker: (sym.circle.filled.tiny, sym.plus))

  align(center, text(size: 2em, weight: "extrabold", smallcaps[Portfolio Personnel]))

  _skills-table

  set page(columns: 2)

  doc
}

/// Draws a portfolio proof
/// - trace-name (str): name of the trace
/// - trace-content (content): what should be shown to represent the trace
/// - trace-comments (content):
/// - associated-teaching (content):
/// - skills (array): an array of criteria identifiers
/// - comments (content):
/// 
/// -> content
#let proof(
  trace-name: "Name",
  trace-content: none,
  trace-comments: none,
  associated-teaching: none,
  skills: (),
  comments: none
) = block(
  stroke: insa-colors.primary,
  radius: 4pt,
  width: 100%,
  height: 100%,
  inset: 1em,
)[
  #align(center, heading(text(fill: insa-colors.primary, trace-name)))
  #metadata((
    "type": "proof",
    "name": trace-name,
    "skills": skills
  ))

  #v(1em)

  #if (trace-content != none) [
    *Trace :* #trace-content
  ] 

  #trace-comments

  #_hline

  #text(size: 1.1em, weight: "bold", "Enseignements en lien :")
  #associated-teaching

  #text(size: 1.1em, weight: "bold", "Compétences :")
  #let skills-crit-dict = (:)
  #for crit-id in skills {
    let (skill-key, crit-i) = _find-criterion(crit-id)
    let crits-array = skills-crit-dict.at(skill-key, default: ())
    crits-array.push(crit-i)
    skills-crit-dict.insert(skill-key, crits-array)
  }
  #for (skill-key, crit-ids) in skills-crit-dict [
    - #_all-skills.at(skill-key).name : #crit-ids.map(crit-index => {
      link(label(_get-criterion-id(skill-key, crit-index)), str(crit-index))
    }).join(", ")
  ]

  #_hline

  #text(size: 1.1em, weight: "bold", "Commentaires :")

  #comments
]
