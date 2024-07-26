#import "@local/japanese-template:0.1.0": *

#show: it => slide-style(it)

#title-slide(
  title: "Typst",
  author: "raygo",
)

#make-index()

#utils.register-section("簡単な例")

#slide(title: "タイトル")[
  === #utils.current-section
  こんな感じでスライドを作れます．\
  次のを使うとブロック生成できます．
  #title-block[
    3以上の整数$n$について，次を満たす自然数$a,b,c$は存在しない．
    $ a^n+b^n=c^n $
  ]
]


#slide(title: "タイトル")[
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
  )[
  ]
  #title-block(
    title: "定義",
    number: true,
    color: "def",
  )[
  ]
  #title-block(
    title: "系・命題・補題・性質",
    number: true,
  )[
  ]
]
// これで色を変えられます
#set page(fill: rgb("#000000"))
#set text(fill: rgb("#ffffff"))
#change-color(color: rgb("#483b6d"))
#change-color(name: "ex", color: rgb("#53531f"))
#change-color(name: "axm", color: rgb("#612828"))
#change-color(name: "def", color: rgb("#2b4263"))
#change-color(name: "thm", color: rgb("#2b5e24"))


#utils.register-section("動的スライド")


#slide(title: "動的スライド")[
  onlyは存在が変更します
  #only(1)[#title-block(
      title: "例",
      number: true,
      color: "ex",
    )[
      これは1枚目のスライドです．
    ]]
  uncoverは表示が変更します
  #uncover(2)[#title-block(
      title: "公理",
      number: true,
      color: "axm",
    )[
      これは2枚目のスライドです．
    ]]

  これはいくつかのタイミングで#uncover("-2, 4, 6-8, 10-")[*表示*]されます

  #uncover(11)[*どうやら限界は10枚のようです*]
]

// 既存のテーマも選べます
#set page(fill: rgb("#ffffff"))
#set text(fill: rgb("#000000"))
#change-color(theme: "pastel")

#slide(title: "動的スライド")[
  #title-block(
    title: "定義",
    number: true,
    color: "def",
  )[
    一つずつ表示されます
  ] #pause

  #title-block(
    title: "定理",
    number: true,
    color: "thm",
  )[
    一つずつ表示されます
  ] #pause
  これが最後
]

#slide(title: "動的スライド")[
  #change-color(name: "other", color: red)
  #title-block(
    title: "定義",
    number: true,
    color: "other",
  )[
    #alternatives(repeat-last: true)[他の][色は][otherを使って変更してください]
  ]
  #change-color(name: "other", color: green)
  #title-block(
    title: "定義",
    number: true,
    color: "other",
  )[
    #alternatives[他の色は][otherを使って変更してください]
  ]
  #change-color(name: "other", color: blue)
  #title-block(
    title: "定義",
    number: true,
    color: "other",
  )[
    他の色はotherを使って変更してください
  ]
]

