#import "template-slide.typ": *

#show: it => slide-style(it)

#title-slide(
  title: "Typst",
  author: "raygo",
)

#slide(
  title: "タイトル"
)[
  こんな感じでスライドを作れます．
  次のを使うとブロック生成できます．
  #title-block(
    title: "定理"
  )[
    3以上の整数$n$について，次を満たす自然数$a,b,c$は存在しない．
    $ a^n+b^n=c^n $
  ]
]

#slide(
  title: "タイトル"
)[
  こんな感じで2枚目のスライドも作れます．
  #title-block(
    title: "定理"
  )[
    ナンバリングもしてくれます．
  ]
  #title-block(
    title: "定理"
  )[
    ナンバリングもしてくれます．
  ]
]