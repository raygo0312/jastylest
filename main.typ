#import "@local/japanese-template:0.1.0": *

#show: jarticle.with()

#maketitle(
  titlepage: true,
  title: [Typstの使い方],
  office: [電気通信大学 情報・ネットワーク工学専攻],
  author: [raygo],
  // date: none,
)

ここに文章を入力すれば，そのまま出力されます．Latin-もいい感じにABCabcと(出力)されます．改行したい場合は\
バックスラッシュで改行できます．

空行を入れると改段落できます．

アクセントは\*で*太字*，\_で_italic_ができます．
= セクション algo
セクションは番号が振られます．
= セクション
== サブセクション
=== サブサブセクション

- \-を打つと
- 箇条書きができます
  - インデントすると
    - 階層ができます
同様に
+ \+で
+ 順序付きリスト
  + が階層付きで
  + できます

インラインは\$で囲むとできます．ブロックは\$で囲み内側にスペースか改行を挟むとできます．

集合$A$の部分集合族$A in scr(A)$．ただし，$scr(A)subset 2^A$である．

文字の積はスペースを入れなければなりません．
$ a b c $
関数などは$sin(theta)$のようにくっつけると出力されます．詳しくは#link("https://typst.app/docs/")[公式ドキュメント]

フォント紹介
#let full = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$
  cal(full)\
  scr(full)\
  frak(full)
$
