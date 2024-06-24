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
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // 数式外の丸括弧の外側に隙間を開ける処理
  let cjk = "(\p{Hiragana}|\p{Katakana}|\p{Han})"
  show regex("("+cjk+"[(])|([)]"+cjk+")") : it => {
    let a = it.text.match(regex("(.)(.)"))
    a.captures.at(0)
    h(0.25em)
    a.captures.at(1)
  }

  // 数式とcjk文字の間に隙間を開ける処理
  show math.equation: it => { // ごり押し
    text(size: 0.000000001pt)[\$]
    it
    text(size: 0.000000001pt)[\$]
  }
  // show: it => { // 探索 (上手くいかない)
  //   let it = it.children
  //   for (i, j) in it.enumerate() {
  //     if j == () {
  //       continue
  //     }
  //     if repr(j.func()) == "equation" {
  //       if i != 0 {
  //         let a = it.at(i - 1)
  //         if a.has("text") and a.text.ends-with(regex(cjk)) {
  //           h(0.25em)
  //         }
  //       }
  //       j
  //       if i != it.len() - 1 {
  //         let a = it.at(i + 1)
  //         if a.has("text") and a.text.starts-with(regex(cjk)) {
  //           h(0.25em)
  //         }
  //       }
  //     } else {
  //       j
  //     }
  //   }
  // }
  // block数式の中のfracをdisplayに変更
  show math.equation.where(block: true): it => {
    show math.frac: math.display
    it
  }

  it
}