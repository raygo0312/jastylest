#import "@preview/polylux:0.3.1": *
#import "template-common.typ": *

// slide style setting
#let slide-style(
  it,
) = {
  set page(paper: "presentation-16-9")
  set text(
    size: 18pt,
    font: font-sans,
  )
  set box(
    width: 100%,
    stroke: rgb("#3377FF"),
    radius: 5pt,
    inset: 10pt,
  )

  show: it => common-style(it)

  it
}

// make title slide
#let title-slide(
  title: "",
  author: "",
) = polylux-slide()[
  #set align(horizon + center)
  = #title
  #v(10pt)
  #author
]

// make slide
#let slide(
  title: "",
  title-bgcolor: rgb("#DDDDFF"),
  verticaly: horizon,
  doc,
) = polylux-slide()[
  #set align(verticaly)
  #v(10pt)
  #place(
    top + left,
    dx: -55pt,
    dy: -55pt,
  )[
    #block(
      width: 840pt,
      height: 50pt,
      fill: title-bgcolor,
      inset: 15pt,
    )[
      = #h(10pt)#title
    ]
  ]
  #doc
  #place(
    bottom + right,
    dx: 40pt,
    dy: 40pt,
  )[
    #counter(page).display("1")
  ]
]

// make block with title
#let block-counter = counter("block")
#let title-block(
  title: "定理",
  title-bgcolor: rgb("#DDDDFF"),
  bgcolor: rgb("#DDDDDD"),
  number: true,
  doc,
) = {
  if number {
    block-counter.step()
  }
  block()[
    #block(
      width: 100%,
      fill: title-bgcolor,
      inset: 10pt,
      spacing: 0pt,
    )[
      == #title #if number {
        block-counter.display()
      }
    ]
    #block(
      width: 100%,
      fill: bgcolor,
      inset: 10pt,
      spacing: 0pt,
    )[
      #doc
    ]
  ]
}
