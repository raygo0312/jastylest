#let font-serif = (
  "CMU Serif",
  "Harano Aji Mincho",
)

#let font-sans = (
  "CMU Sans Serif",
  "Harano Aji Gothic",
)
// 数式コマンド
#let cal(a) = text(font: "KaTeX_Caligraphic")[#a]
#let scr(a) = text(font: "KaTeX_Script")[#a]
// 数式環境のデコレーション関数
#let mbox(
  it,
) = box(
  stroke: rgb("#000000"),
  inset: 0.2em,
  baseline: 0.2em,
  radius: 0.3em,
)[
  $#it$
]
#let red(
  it,
) = text(
  fill: rgb("#FF0000"),
)[
  $#it$
]
#let blue(
  it,
) = text(
  fill: rgb("#0000FF"),
)[
  $#it$
]
#let mh = h(1em)
// 定理環境
#let ex(it) = box(
  width: 100%,
  stroke: rgb("#000000"),
  radius: 5pt,
  inset: 10pt,
)[
  #counter("ex").step()
  例#counter("ex").display()\
  #it
]
#let pro(it) = {
  grid(
    columns: 2,
    gutter: 10pt,
    {
      counter("pro").step()
      "("
      counter("pro").display()
      ")"
    },
    it
  )
  v(1em)
}
// common style setting
#let common-style(it) = {
  // 数式とcjk文字の間に隙間を開ける処理
  // 開発者早く直せ
  show math.equation : equ => {
    text(size: 0.000000001pt)[\$]
    equ
    text(size: 0.000000001pt)[\$]
  }
  show "(" : lp => {
    text(size: 0.000000001pt)[\$]
    lp
  }
  show ")" : lp => {
    lp
    text(size: 0.000000001pt)[\$]
  }

  show math.equation.where(block: true) : it => {
    v(-1em)
    it
    v(-1em)
  }
  show link: underline

  show "LaTeX": box(
    width: 2.7em,
    height: 1em,
    baseline: 0.25em,
    stroke: none,
    inset: 0pt,
    image("img/LaTeX_logo.svg", width: 100%)
  )

  it
}