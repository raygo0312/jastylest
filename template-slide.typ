#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/polylux:0.4.0": *
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
  normal: (
    title: rgb("#66a5ad"),
    ex: rgb("#e3e2b4"),
    axm: rgb("#f4acb7"),
    def: rgb("#bfc8d7"),
    thm: rgb("#a2b59f"),
  ),
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
  theme-color
    .at(name)
    .update(x => {
      color
    })
}
// slide style setting
#let slide-style(
  handout: false,
  it,
) = {
  set page(
    paper: "presentation-16-9",
    width: 960pt,
    height: 540pt,
    margin: 50pt,
  )
  set text(
    size: 24pt,
    font: font-sans,
  )
  // handoutをtrueにすると動的スライドを無効化
  show: it => {
    if handout {
      enable-handout-mode(true)
    }
    it
  }
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
  toolbox.register-section(section)
  counter("slide").step()
}
#let section-name = toolbox.current-section

// make title slide
#let title-slide(
  title: "",
  author: "",
) = slide[
  #set align(horizon + center)
  = #title
  #v(10pt)
  #author
]

// make slide
#let slide(
  title: "",
  verticaly: horizon,
  doc,
) = polylux-slide[
  #context {
    // バグ：本来置かれる位置に移動するため、本文の位置を調節するため
    hide[\$]
    place(
      top + left,
      dx: -50pt,
      dy: -50pt,
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
    dx: 50pt - 20pt,
    dy: 50pt - 20pt,
  )[
    #toolbox.slide-number/#toolbox.last-slide-number
  ]
]

// make index slide
#let make-index() = slide(title: "目次")[
  #toolbox.all-sections((sections, current) => {
    enum(..sections)
  })
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
