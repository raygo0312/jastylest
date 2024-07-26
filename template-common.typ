#import "@preview/physica:0.9.3": *

// font setting
#let font-serif = (
  "CMU Serif",
  "Harano Aji Mincho",
)
#let font-sans = (
  "CMU Sans Serif",
  "Harano Aji Gothic",
)

// color setting
#let theme-color = (
  title: state("title", rgb("#66a5ad")),
  ex: state("ex", rgb("#e3e2b4")),
  axm: state("axm", rgb("#f4acb7")),
  def: state("def", rgb("#bfc8d7")),
  thm: state("thm", rgb("#a2b59f")),
  other: state("other", rgb("#f9f8c4")),
)
#let preset-color = (
  pastel: (
    title: rgb("#fbd8b5"),
    ex: rgb("#f9f8c4"),
    axm: rgb("#f8ced3"),
    def: rgb("#d2d5ec"),
    thm: rgb("#daecd4"),
  ),
  dark: (
    title: rgb("#483b6d"),
    ex: rgb("#53531f"),
    axm: rgb("#612828"),
    def: rgb("#2b4263"),
    thm: rgb("#2b5e24"),
  ),
)
#let change-color(
  theme: "",
  name: "title",
  color: rgb("#AADDFF"),
) = {
  if preset-color.keys().contains(theme) {
    for (key, value) in preset-color.at(theme) {
      change-color(name: key, color: value)
    }
    return
  }
  theme-color.at(name).update(x => {
    color
  })
}

// 数式コマンド
#let cal(a) = text(font: "KaTeX_Caligraphic")[#a]
#let scr(a) = text(font: "KaTeX_Script")[#a]

// common style setting
#let common-style(it) = {
  // 設定日本語
  set text(lang: "ja")

  // リンクに下線を引く
  show link: underline
  // インデント設定
  set list(indent: 1.5em)
  set enum(indent: 1.5em)
  // 表のキャプションを上に
  show figure.where(kind: table): set figure.caption(position: top)

  // 数式外の丸括弧の外側に隙間を開ける処理
  let cjk = "(\p{Hiragana}|\p{Katakana}|\p{Han})"
  show regex("(" + cjk + "[(])|([)]" + cjk + ")"): it => {
    let a = it.text.match(regex("(.)(.)"))
    a.captures.at(0)
    h(0.25em)
    a.captures.at(1)
  }

  // block数式の中のfracをdisplayに変更
  show math.equation.where(block: true): it => {
    show math.frac: math.display
    it
  }


  // 数式とcjk文字の間に隙間を開ける処理
  show math.equation: it => {
    // size0にするとpreviewででかく表示されるバグがある
    hide[#text(size: 0.00000000000001pt)[\$]]
    it
    hide[#text(size: 0.00000000000001pt)[\$]]
  }

  it
}