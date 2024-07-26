#import "@preview/polylux:0.3.1": *
#import "template-common.typ": *

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
    // numbering: "1/1",
    // number-align: right + bottom,
  )
  set text(
    size: 24pt,
    font: font-sans,
  )

  show: it => common-style(it)

  it
}

// make title slide
#let title-slide(
  title: "",
  author: "",
) = polylux-slide[
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
  title: "定理",
  number: false,
  color: "thm",
  doc,
) = {
  if number {
    counter("title-block").step()
  }
  context {
    block()[
      #block(
        width: 100%,
        fill: theme-color.at(color).get(),
        stroke: theme-color.at(color).get(),
        inset: 10pt,
        spacing: 0pt,
      )[
        #title #if number {
          let section = utils.sections-state.get().len()
          if section != 0 {
            str(section)
            "."
          }
          counter("title-block").display()
        }
      ]
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
