#import "@local/japanese-template:0.1.0": *

#show: jslide.with()

#title-slide(
  title: "Typst",
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

#slide[
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

#slide[
  動的なスライドも作れます．

  詳しくは#link("https://polylux.dev/book/dynamic/dynamic.html")[polyluxの公式ドキュメント]を参照してください．
  #item-by-item[
    - first
    - second
    - third
  ]
]
#section("色の替え方")

#slide[
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
  )[
    titleの初期値も変わります．
  ]
  #title-block(
    title: "系・命題・補題・性質",
    number: true,
    color: "thm",
  )[]
]

#slide(color: rgb("#ff851b"))[
  #title-block(
    title: "例",
    number: true,
    color: red,
  )[
    他の色を選びたいときはcolorを指定してください．
  ]
  #title-block(
    title: "例",
    number: true,
  )[
    実はラベリングもできます．例@a のように
  ]<a>
]

#let slide = slide.with(color: blue)
#let title-block = title-block.with(color: green)

#slide[
  #title-block(
    title: "例",
    number: true,
  )[
    こうすると，デフォルトの色を変更できます．
  ]
]
