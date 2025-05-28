#let cal(it) = text(font: "KaTeX_Caligraphic")[#it]
#let scr(it) = text(font: "KaTeX_Script")[#it]
#let frak(it) = text(font: "KaTeX_Fraktur")[#it]

#let problem(it) = {
  block(inset: 10pt, width: 100%, stroke: black)[
    *問題*

    #it
  ]
}
#let proof(it) = [*証明*：#it#align(right)[$square.stroked$]]

// 共通のスタイル設定
#let common-style(it) = {
  // 設定日本語
  set text(lang: "ja")

  // リンクに下線を引く
  show link: underline.with(offset: 0pt)

  // リスト設定
  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  set underline(offset: 0.2em)

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

  // title-blockのラベリング
  show ref: it => {
    if it.element != none and it.element.children.at(0).at("key") == "slide" {
      numbering(
        "1.1",
        ..counter("theorem").get(),
      )
    }
  }

  it
}

// ドキュメントのスタイル設定
#let jarticle(
  seriffont: "New Computer Modern",
  seriffont-cjk: "Harano Aji Mincho",
  sansfont: "Arial",
  sansfont-cjk: "Harano Aji Gothic",
  paper: "a4",
  font-size: 11pt,
  cols: 1,
  titlepage: false,
  title: none,
  office: none,
  author: none,
  date: datetime.today().display("[year]年[month repr:numerical padding:none]月[day padding:none]日"),
  it,
) = {
  // ページ設定
  set page(
    paper: paper,
    numbering: "1",
    columns: cols,
  )
  // テキスト設定
  set text(
    font: ((name: seriffont, covers: "latin-in-cjk"), seriffont-cjk),
    size: font-size,
    weight: "medium",
  )

  // 見出し設定
  set heading(numbering: "1.1")
  show heading: set text(
    font: ((name: sansfont, covers: "latin-in-cjk"), sansfont-cjk),
    weight: "medium",
  )
  show heading: it => {
    v(1em)
    set par(first-line-indent: 0em)
    if it.numbering != none {
      counter(heading).display(it.numbering)
    }
    h(1em)
    it.body
  }
  // 段落設定
  set par(
    leading: 0.8em,
    first-line-indent: 1em,
    justify: true,
  )

  // その他の設定
  set columns(gutter: 2em)
  show: common-style.with()

  // タイトル生成
  if title != none {
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

  it
}

// スライドのスタイル設定
#let jslide(
  font: "Arial",
  font-cjk: "Harano Aji Gothic",
  paper: "presentation-16-9",
  height: 540pt,
  font-size: 24pt,
  margin: 30pt,
  title-color: rgb("#84c0c7"),
  title: none,
  author: none,
  date: datetime.today().display("[year]年[month repr:numerical padding:none]月[day padding:none]日"),
  it,
) = {
  // 変数の計算
  let width = if paper == "presentation-16-9" {
    height * 16 / 9
  } else if paper == "presentation-4-3" {
    height * 4 / 3
  } else {
    panic("Unsupported paper size: " + paper)
  }
  let totalpage = counter("lastpage")

  // ドキュメント設定
  if title != none {
    set document(title: title)
  }
  if author != none {
    set document(author: author)
  }
  // ページ設定
  set page(
    paper: paper,
    width: width,
    height: height,
    margin: (top: 2 * margin, right: margin, bottom: margin, left: margin),
    header: context {
      let page = here().page()
      let headings = query(selector(heading.where(level: 2)))
      let pos = headings.rev().position(it => it.location().page() <= page)
      let heading-index = if pos != none { headings.len() - pos - 1 } else { none }
      if heading-index != none {
        place(
          top,
          dx: -margin,
        )[
          #block(
            width: width,
            height: 2em,
            fill: title-color,
            inset: 0.5em,
          )[
            #set text(1.2em, weight: "bold")
            #headings.at(heading-index).body
            #let multi-pages = false
            #let heading-page = headings.at(heading-index).location().page()
            #if headings.len() - 1 == heading-index {
              multi-pages = heading-page != totalpage.final().at(0)
            } else {
              multi-pages = heading-page + 1 != headings.at(heading-index + 1).location().page()
            }
            #if multi-pages [
              #numbering("(i)", page - headings.at(heading-index).location().page() + 1)
            ]
          ]
        ]
      }
    },
    header-ascent: 0pt,
    footer: [
      #set align(right)
      #context counter(page).display("1/1", both: true)
    ],
    footer-descent: 0pt,
  )
  // テキスト設定
  set text(
    size: font-size,
    font: (font, font-cjk),
  )
  // その他の設定
  set align(horizon)
  set outline(target: heading.where(level: 1), title: none)
  show outline.entry: it => [
    - #it
  ]
  set bibliography(title: none)
  show heading.where(level: 1): it => context {
    let heading-num = query(selector(heading.where(level: 1)).before(here())).len()
    counter("title-block").update((heading-num, 0))
    set page(header: none, footer: none)
    set align(center)
    set text(1.2em, weight: "bold")
    v(-10pt)
    it.body
  }
  show heading.where(level: 2): pagebreak(weak: true)

  // タイトル生成
  if title != none {
    if (type(author) != array) {
      author = (author,)
    }
    set page(footer: none)
    set align(center)
    text(
      size: 2.0em,
      weight: "bold",
      fill: title-color,
    )[
      #title
    ]
    if author != none {
      v(1em, weak: true)
      author.join(", ")
    }
    if date != none {
      v(1.4em, weak: true)
      text(1.1em, date)
    }
    pagebreak(weak: true)
  }

  show: common-style.with()

  it

  context totalpage.update(here().page())
}

// タイトル付きブロック
#let title-block(
  title: none,
  number: false,
  title-color: rgb("#84c0c7"),
  doc,
) = {
  if number {
    counter("title-block").step(level: 2)
  }
  block(sticky: true)[
    #if title != none {
      block(
        width: 100%,
        fill: title-color,
        stroke: title-color,
        inset: 10pt,
        spacing: 0pt,
        radius: (top: 5pt, bottom: 0pt),
      )[
        #title
        #context if number {
          counter("title-block").display("1.1")
        }
      ]
    }
    #if type(title-color) == gradient {
      title-color = title-color.sample(50%)
    }
    #block(
      width: 100%,
      fill: title-color.transparentize(70%),
      stroke: title-color,
      inset: 10pt,
      spacing: 0pt,
      radius: (top: 0pt, bottom: 5pt),
    )[
      #doc
    ]
  ]
}
