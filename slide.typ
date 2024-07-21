#import "@local/japanese-template:0.1.0": *

#show: it => slide-style(it)

#title-slide(
  title: "Typst",
  author: "raygo",
)

#make-index()

#utils.register-section("セクション1")

#slide(title: "タイトル")[
  #utils.current-section
  こんな感じでスライドを作れます．\
  次のを使うとブロック生成できます．
  #title-block()[
    3以上の整数$n$について，次を満たす自然数$a,b,c$は存在しない．
    $ a^n+b^n=c^n $
  ]
]

#utils.register-section("セクション2")

#slide(title: "タイトル")[
  こんな感じで2枚目のスライドも作れます．
  #title-block(
    title: "定義",
    number: true,
  )[
    ナンバリングもしてくれます．
  ]
  #title-block(
    title: "系",
    number: true,
  )[
    ナンバリングもしてくれます．
  ]
]

#slide(title: "動的スライド")[
  前#only(1)[*これは1枚目のスライドです．*]onlyは存在が変更します

  前#uncover(2)[*これは2枚目のスライドです．*]uncoverは表示が変更します

  これは#uncover("-2, 4, 6-8, 10-")[*表示*]いくつかのタイミングで表示されます

  #uncover(11)[*どうやら限界は10枚のようです*]
]

#slide(title: "動的スライド")[
  段落を #pause

  一旦 #pause

  止める
]

#slide(title: "動的スライド")[
  #one-by-one[これは][文字列を途][中で切れる]
]

#slide(title: "動的スライド")[
  #only(4)[またみてね]
  #alternatives(repeat-last: true)[予告][使途][襲来]
  #alternatives[*予告*][*使途*][*襲来*]
]