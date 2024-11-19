#import "@local/japanese-template:0.1.0": *

#show: it => slide-style(it)

#title-slide(
  "Typst",
  author: "raygo",
)

#make-index()

#section("簡単な例")

#slide(title: "タイトル")[
  こんな感じでスライドを作れます．\
  次のを使うとブロック生成できます．
  #title-block[
    3以上の整数$n$について，
    $ a^n+b^n=c^n $
    を満たす自然数$a,b,c$は存在しない．
  ]
]

#slide()[
  こんな感じで2枚目のスライドも作れます．
  #title-block(
    title: "例",
    number: true,
    color: "ex",
  )[
    ナンバリングもしてくれます．
  ]
  #title-block(
    title: "公理",
    number: true,
    color: "axm",
  )[]
  #title-block(
    title: "定義",
    number: true,
    color: "def",
  )[]
  #title-block(
    title: "系・命題・補題・性質",
    number: true,
    color: "thm",
  )[]
]
// これで色を変えられます
#set page(fill: rgb("#000000"))
#set text(fill: rgb("#ffffff"))
#change-color(color: rgb("#483b6d"))
#change-color(name: "ex", color: rgb("#53531f"))
#change-color(name: "axm", color: rgb("#612828"))
#change-color(name: "def", color: rgb("#2b4263"))
#change-color(name: "thm", color: rgb("#2b5e24"))

#section("ダークテーマ")

#slide()[
  #title-block(
    title: "例",
    number: true,
    color: "ex",
  )[
    ```typst
    #section("セクション")
    ```
    でスライドを分割できます．
  ]
  #title-block(
    title: "公理",
    number: true,
    color: "axm",
  )[
    blockの番号は振り直します．
  ]
  #title-block(
    title: "定義",
    number: true,
    color: "def",
  )[]
  #title-block(
    title: "系・命題・補題・性質",
    number: true,
    color: "thm",
  )[]
]

#set page(fill: rgb("#ffffff"))
#set text(fill: rgb("#000000"))
// 既存のテーマも選べます
#change-color(theme: "pastel")
#section("パステルテーマ")

#slide()[
  #title-block(
    title: "例",
    number: true,
    color: "ex",
  )[
    ```typst
    #section("セクション")
    ```
    でスライドにセクションを付けることができます．
  ]
  #title-block(
    title: "公理",
    number: true,
    color: "axm",
  )[]
  #title-block(
    title: "定義",
    number: true,
    color: "def",
  )[]
  #title-block(
    title: "系・命題・補題・性質",
    number: true,
    color: "thm",
  )[]
]

#slide()[
  #change-color(name: "other", color: red)
  #title-block(
    title: "例",
    number: true,
    color: "other",
  )[
    他の色を選びたいときはotherを使用してください．
  ]
  #change-color(name: "other", color: blue)
  #title-block(
    title: "例",
    number: true,
    color: "other",
  )[
    実はラベリングもできます．例@a のように
  ]<a>
]