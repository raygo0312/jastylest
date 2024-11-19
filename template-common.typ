// font setting
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