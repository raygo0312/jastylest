#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/polylux:0.4.0": *
#import "prooftree.typ"

#let cal(it) = text(font: "KaTeX_Caligraphic")[#it]
#let scr(it) = text(font: "KaTeX_Script")[#it]

#let common-style(it) = {
  // 設定日本語
  set text(lang: "ja")

  // リンクに下線を引く
  show link: underline

  // リスト設定
  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  // 表のキャプションを上に
  show figure.where(kind: table): set figure.caption(position: top)

  // 数式のrefを可能にする
  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      numbering(
        el.numbering,
        ..counter(eq).at(el.location()),
      )
    } else {
      it
    }
  }

  // 数式外の丸括弧の外側に隙間を開ける処理
  let cjk = "(\p{Hiragana}|\p{Katakana}|\p{Han})"
  show regex("(" + cjk + "[(])|([)]" + cjk + ")"): it => {
    let a = it.text.match(regex("(.)(.)"))
    a.captures.at(0)
    h(0.25em)
    a.captures.at(1)
  }

  // 数式とcjk文字の間に隙間を開ける処理
  show math.equation.where(block: false): it => {
    // size0にするとpreviewででかく表示されるバグがある
    hide[#text(size: 0.00000000000001pt)[\$]]
    it
    hide[#text(size: 0.00000000000001pt)[\$]]
  }

  it
}

#let jarticle(
  seriffont: "New Computer Modern",
  seriffont-cjk: "Harano Aji Mincho",
  sansfont: "Arial",
  sansfont-cjk: "Harano Aji Gothic",
  paper: "a4", // paper size
  font-size: 11pt, // font size
  cols: 1,
  it,
) = {
  // set the paper settings
  set page(
    paper: paper,
    numbering: "1",
    columns: cols,
  )
  // set the text settings
  set text(
    font: (seriffont, seriffont-cjk),
    size: font-size,
    weight: "medium",
  )

  // section settings
  set heading(numbering: "1.1")
  show heading: set text(
    font: (sansfont, sansfont-cjk),
    weight: "medium",
  )
  show heading: it => {
    v(1em)
    set par(first-line-indent: 0em)
    counter(heading).display(it.numbering)
    h(1em)
    it.body
  }

  // other settings
  set columns(gutter: 2em)
  // paragraph settings
  set par(
    leading: 0.8em,
    first-line-indent: 1em,
    justify: true,
  )

  show: common-style.with()

  it
}

#let maketitle(
  titlepage: false, // make a title page
  title: "", // document title
  office: none, // author's office
  author: none, // author's name
  date: datetime
    .today()
    .display("[year]年[month repr:numerical padding:none]月[day padding:none]日"), // insert today's date
) = {
  align(center)[
    #if titlepage {
      context {
        let pageheight = page.height
        set text(size: 1.5em)
        v(pageheight / 7)
        text(size: 2em)[
          #title
        ]
        v(pageheight / 7)
        office
        parbreak()
        author
        v(pageheight / 7)
        date
        pagebreak()
      }
    } else {
      text(size: 1.7em)[
        #title
      ]
      parbreak()
      [#office\ #author]
      parbreak()
      date
      v(1em)
    }
  ]
}

// color setting
#let theme-color = (
  default: rgb("#66a5ad"),
  ex: rgb("#e3e2b4"),
  axm: rgb("#f4acb7"),
  def: rgb("#bfc8d7"),
  thm: rgb("#a2b59f"),
)
#let slide-margin = 30pt
// slide style setting
#let jslide(
  handout: false, // 動的スライドを有効化(初期値:false)
  sansfont: "Arial",
  sansfont-cjk: "Harano Aji Gothic",
  paper: "presentation-16-9",
  font-size: 24pt,
  it,
) = {
  set page(
    paper: paper,
    width: 960pt,
    height: 540pt,
    margin: slide-margin,
  )
  set text(
    size: font-size,
    font: (sansfont, sansfont-cjk),
  )

  // handoutをtrueにすると動的スライドを無効化
  enable-handout-mode(handout)

  // title-blockのラベリング
  show ref: it => {
    if it.element != none and it.element.children.at(0).at("key") == "slide" {
      numbering(
        "1.1",
        ..counter("slide").get(),
      )
    }
  }

  show: common-style.with()

  it
}

// セクションに関する関数
#let section(section) = {
  toolbox.register-section(section)
  counter("slide").step()
}

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
  title: toolbox.current-section,
  verticaly: horizon,
  color: "default",
  doc,
) = polylux-slide[
  #context {
    // バグ：本来置かれる位置に移動するため、本文の位置を調節するため
    hide[\$]
    place(
      top + left,
      dx: -slide-margin,
      dy: -slide-margin,
    )[
      #block(
        width: page.width,
        height: 2em,
        fill: {
          if type(color) == str {
            theme-color.at(color)
          } else {
            color
          }
        },
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
    dx: slide-margin - 20pt,
    dy: slide-margin - 20pt,
  )[
    #toolbox.slide-number/#toolbox.last-slide-number
  ]
]

// make white slide
#let empty-slide = polylux-slide[#v(1pt)]

// make index slide
#let make-index() = slide(title: "目次")[
  #toolbox.all-sections((sections, current) => {
    enum(..sections)
  })
]

// make block with title
#let title-block(
  title: none,
  number: false,
  color: "default",
  doc,
) = {
  let color = if type(color) == str {
    theme-color.at(color)
  } else {
    color
  }
  if number {
    counter("slide").step(level: 2)
    let title-name = state("title-name", title)
  }
  block()[
    #if title != none {
      block(
        width: 100%,
        fill: color,
        stroke: color,
        inset: 10pt,
        spacing: 0pt,
      )[
        #title
        #context if number {
          counter("slide").display()
        }
      ]
    }
    #if type(color) == gradient {
      color = color.sample(50%)
    }
    #block(
      width: 100%,
      fill: color.transparentize(70%),
      stroke: color,
      inset: 10pt,
      spacing: 0pt,
    )[
      #doc
    ]
  ]
}
