#import "template-common.typ": *

#let jarticle(
  titlepage: false, // make a title page
  title: "", // document title
  office: "", // author's office
  author: "", // author's name
  date: false, // insert today's date
  it,
) = {
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
      text(
        size: 16pt,
      )[
        #office\
        #author
      ]
      v(100pt)
      if date [
        #text(
          size: 16pt,
        )[
          #datetime.today().year()年#datetime.today().month()月#datetime.today().day()日
        ]
      ]
      pagebreak()
    } else {
      text(size: 17pt)[
        #title
      ]
      parbreak()
      text(size: 12pt)[
        #if office != "" [
          #office\
        ]
        #author
      ]
      linebreak()
      if date [
        #text(
          size: 12pt,
        )[
          #datetime.today().year()年#datetime.today().month()月#datetime.today().day()日
        ]
      ]
    }
  ]
  set page(numbering: "1") if titlepage
  if titlepage {
    counter(page).update(1)
  }

  // set the fonts for text
  set text(
    font: font-serif,
    size: 11pt
  )

  // paragraph settings
  set par(
    leading: 1em,
    first-line-indent: 1em
  )

  // section settings
  set heading(numbering: "1.1")
  show heading: it => {
    set text(
      font: font-sans,
      weight: "regular",
    )
    v(1em)
    set par(first-line-indent: 0em)
    counter(heading).display(
      it.numbering
    )
    h(2em)
    it.body
    v(1em)
  }

  it
}