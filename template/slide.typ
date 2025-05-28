#import "@local/jastylest:0.1.0": *

#show: jslide.with(
  // font: "Arial",
  // font-cjk: "Harano Aji Gothic",
  // paper: "presentation-4-3",
  // height: 1080pt,
  // font-size: 24pt,
  // margin: 30pt,
  // title-color: red,
  title: [スライドの作り方],
  author: ("raygo", "etc."),
  // date: none,
)

== 目次
#outline()
= いっこめ

== タイトル

#lorem(500)

= ふたつめ

== aaaa

== タイトル
#title-block(title: [定理])[これは定理です]
#title-block(title: [例], number: true, title-color: red)[色をかえられます]
