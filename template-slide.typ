#import "@preview/polylux:0.3.1": *
#import "template-common.typ": *

#let theme-color = rgb("#AADDFF")
// slide style setting
#let slide-style(
  it,
) = {
  set page(
    paper: "presentation-16-9",
    margin: (
      top: 50pt,
      bottom: 0pt,
      left: 50pt,
    ),
  )
  set text(
    size: 20pt,
    font: font-sans,
  )
  set box(
    width: 100%,
    stroke: theme-color,
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
  verticaly: horizon,
  doc,
) = polylux-slide()[
  #set align(verticaly)
  #v(10pt)
  #place(
    top + left,
    dx: -50pt,
    dy: -50pt,
  )[
    #block(
      width: 840pt,
      height: 50pt,
      fill: theme-color,
      inset: 15pt,
    )[
      = #h(10pt)#title
    ]
  ]
  #doc
  #place(
    bottom + right,
    dx: 30pt,
    dy: -10pt,
  )[
    #counter(page).display("1")
  ]
]

// make block with title
#let title-block(
  title: "定理",
  number: false,
  doc,
) = {
  if number {
    counter("title-block").step()
  }
  block()[
    #block(
      width: 100%,
      fill: theme-color,
      stroke: theme-color,
      inset: 10pt,
      spacing: 0pt,
    )[
      #title #if number {
        counter("title-block").display()
      }
    ]
    #block(
      width: 100%,
      stroke: theme-color,
      inset: 10pt,
      spacing: 0pt,
    )[
      #doc
    ]
  ]
}
