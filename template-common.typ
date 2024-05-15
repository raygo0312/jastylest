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
  // 開発者早く直して
  show math.equation : equ => {
    text(size: 0pt)[\$]
    equ
    text(size: 0pt)[\$]
  }

  // paragraph settings
  set par(
    leading: 0.8em,
    first-line-indent: 1em,
    justify: true,
  )
  show link: underline

  it
}