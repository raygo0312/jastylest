#import "@preview/polylux:0.3.1": *
#import "template-common.typ": *

// color setting
#let theme-color = (
  title: state("title", rgb("#66a5ad")),
  ex: state("ex", rgb("#e3e2b4")),
  axm: state("axm", rgb("#f4acb7")),
  def: state("def", rgb("#bfc8d7")),
  thm: state("thm", rgb("#a2b59f")),
  other: state("other", rgb("#000000")),
)
#let preset-color = (
  pastel: (
    title: rgb("#fbd8b5"),
    ex: rgb("#f9f8c4"),
    axm: rgb("#f8ced3"),
    def: rgb("#d2d5ec"),
    thm: rgb("#daecd4"),
  ),
  dark: (
    title: rgb("#483b6d"),
    ex: rgb("#53531f"),
    axm: rgb("#612828"),
    def: rgb("#2b4263"),
    thm: rgb("#2b5e24"),
  ),
)
#let change-color(
  theme: "",
  name: "title",
  color: rgb("#AADDFF"),
) = {
  if preset-color.keys().contains(theme) {
    for (key, value) in preset-color.at(theme) {
      change-color(name: key, color: value)
    }
    return
  }
  theme-color.at(name).update(x => {
    color
  })
}

#let margin = 50pt
// slide style setting
#let slide-style(
  it,
) = {
  set page(
    paper: "presentation-16-9",
    width: 960pt,
    height: 540pt,
    margin: (rest: margin),
  )
  set text(
    size: 24pt,
    font: font-sans,
  )
  // title-blockのラベリング
  show ref: it => {
    if it.element != none and it.element.children.at(0).at("key") == "slide" {
      numbering(
        "1.1",
        ..counter("slide").get(),
      )
    }
  }

  show: it => common-style(it)

  it
}

// セクションに関する関数
#let section(section) = {
  utils.register-section(section)
  counter("slide").step()
}
#let section-name = utils.current-section

// make title slide
#let title-slide(
  title,
  author: "",
) = polylux-slide[
  #set align(horizon + center)
  = #title
  #v(10pt)
  #author
]

// make slide
#let slide(
  title: section-name,
  verticaly: horizon,
  doc,
) = polylux-slide[
  #context {
    // バグ：本来置かれる位置に移動するため、本文の位置を調節するため
    hide[\$]
    place(
      top + left,
      dx: -margin,
      dy: -margin,
    )[
      #block(
        width: page.width,
        height: 2em,
        fill: theme-color.at("title").get(),
        inset: 0.5em,
      )[
        == #title
      ]
    ]
  }
  #set align(verticaly)
  #doc
  #place(
    right + bottom,
    dx: margin - 20pt,
    dy: margin - 20pt,
  )[
    #logic.logical-slide.display()/#utils.last-slide-number
  ]
]

// make index slide
#let make-index() = slide(title: "目次")[
  #utils.polylux-outline()
]

// make block with title
#let title-block(
  title: "",
  number: false,
  color: "title",
  doc,
) = {
  if number {
    counter("slide").step(level: 2)
    let title-name = state("title-name", title)
  }
  context {
    block()[
      #if title != "" {
        block(
          width: 100%,
          fill: theme-color.at(color).get(),
          stroke: theme-color.at(color).get(),
          inset: 10pt,
          spacing: 0pt,
        )[
          #title #if number {
            counter("slide").display()
          }
        ]
      }
      #block(
        width: 100%,
        fill: theme-color.at(color).get().transparentize(70%),
        stroke: theme-color.at(color).get(),
        inset: 10pt,
        spacing: 0pt,
      )[
        #doc
      ]
    ]
  }
}
