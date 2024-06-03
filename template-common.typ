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
  // 開発者早く直せ
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