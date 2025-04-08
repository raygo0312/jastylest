#import "template-common.typ": *

#let font-size = 11pt

#let jarticle(
  titlepage: false, // make a title page
  title: "", // document title
  office: "", // author's office
  author: "", // author's name
  date: false, // insert today's date
  heading-numbering: true, // numbering for headings
  column: false,
  it,
) = {
  // set the fonts for text
  set text(
    font: font-serif,
    size: font-size,
  )

  // make a title
  set page(numbering: "1") if not titlepage
  align(center)[
    #if titlepage {
      v(100pt)
      text(
        size: 25pt,
        font: font-sans,
      )[
        #title
      ]
      v(100pt)
      text(size: 16pt)[
        #office\
        #author
      ]
      v(100pt)
      if date [
        #text(size: 16pt)[
          #datetime.today().year()年#datetime.today().month()月#datetime.today().day()日
        ]
      ]
      pagebreak()
    } else {
      text(
        size: 17pt,
        font: font-sans,
      )[
        #title
      ]
      v(0.5em)
      text(size: font-size)[
        #if office != "" [
          #office\
        ]
        #author
      ]
      parbreak()
      if date [
        #text(size: font-size)[
          #datetime.today().year()年#datetime.today().month()月#datetime.today().day()日
        ]
      ]
      v(1em)
    }
  ]

  set page(numbering: "1") if titlepage
  if titlepage {
    counter(page).update(1)
  }

  // section settings
  set heading(numbering: "1.1")
  show heading: it => {
    set text(
      font: font-sans,
      weight: "regular",
    )
    v(font-size)
    set par(first-line-indent: 0em)
    if heading-numbering {
      counter(heading).display(it.numbering)
      h(1em)
    }
    it.body
    v(font-size)
  }
  // paragraph settings
  set par(
    leading: 0.8em,
    first-line-indent: 1em,
    justify: true,
  )

  show: it => {
    if column {
      columns(2)[#it]
    } else {
      it
    }
  }

  show: it => common-style(it)

  it
}
