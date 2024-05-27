#let font-serif = (
  "CMU Serif",
  "Harano Aji Mincho",
)

#let font-sans = (
  "CMU Sans Serif",
  "Harano Aji Gothic",
)

#let cal(a) = text(font: "KaTeX_Caligraphic")[#a]
#let scr(a) = text(font: "KaTeX_Script")[#a]

// common style setting
#let common-style(it) = {
  // 数式とcjk文字の間に隙間を開ける処理
  show math.equation : equ => {
    text(size: 0pt)[\$]
    equ
    text(size: 0pt)[\$]
  }
  show "(" : lp => {
    text(size: 0pt)[\$]
    lp
  }
  show ")" : lp => {
    lp
    text(size: 0pt)[\$]
  }
  // 開発者早く直せ

  // paragraph settings
  set par(
    leading: 0.8em,
    first-line-indent: 1em,
    justify: true,
  )
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