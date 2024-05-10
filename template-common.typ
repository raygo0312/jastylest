// 数式とcjk文字の間に隙間を開ける処理
// 開発者早く直せ
#let equation-cjk-space(it) = {
  text(size: 0pt)[\$]
  it
  text(size: 0pt)[\$]
}

#let font-serif = (
  "CMU Serif",
  "Harano Aji Mincho",
)

#let font-sans = (
  "CMU Sans Serif",
  "Harano Aji Gothic",
)

#let scr(a) = math.class(
  "normal",
  text(
    font: "CMU Serif",
    stylistic-set: 01,
  )[$cal(#a)$]
)