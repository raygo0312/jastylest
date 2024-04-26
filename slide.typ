#import "template-slide.typ": *

#show: it => slide-style(
  it
)

// タイトルスライド
#title-slide(
  title: "Typst",
  author: "raygo",
)

#slide(
  title: "はじめに"
)[
  #title-block[
    3以上の整数$n$について，次を満たす自然数$a,b,c$は存在しない．
    $ a^n+b^n=c^n scr(A) $
  ]
]