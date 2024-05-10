# Typstの日本語テンプレート

Typstの日本語テンプレートを作成しました．修正点があればissueにあげるか，pull requestを送ってください．

## Typstのインストール

ここでは，VSCodeを用いたインストール方法を記載します．その他の方法は，
- Web版を使いたい場合 : [公式ページ](https://typst.app/)
- Terminal上で使いたい場合 : [GitHub](https://github.com/typst/typst)

を参照してください．

VSCodeに拡張機能を入れます．
- Typst LSP (必須)
- Typst Preview (おすすめ)

このテンプレートを使用する場合は次のフォントをインストールしてもらう必要があります．
- [原ノ味フォント](https://github.com/trueroad/HaranoAjiFonts)
- [COMPUTER MODERN](https://www.fontsquirrel.com/fonts/computer-modern)

具体的な使い方は[公式ドキュメント](https://typst.app/docs/)か解説ブログをご覧ください。

## テンプレートファイル

テンプレートファイルには次のものがあります．
- template-common.typ : ドキュメントとスライド共通のテンプレート
- template-document.typ : ドキュメントを作成するためのテンプレート
- template-slide.typ : スライドを作成するためのテンプレート

## Typstのコンパイル

次の順序で作成，コンパイルします．
1. 拡張子を`typ`にしてファイルを作成します．
1. ファイルを書き込みます．Typst Previewを入れている場合は，VSCodeの右上に表示されている虫眼鏡がついた分割ページのアイコンをクリック，またはコマンド`Typst: Show the compiled PDF of the currently opened typst file`を入力すると，リアルタイムでコンパイルされたドキュメントを確認しながらコーディングできます．
1. 書き込んだファイルを`ctrl+s`で保存すると同名のPDFファイルが作成されます．

## ドキュメントの作成

`main.typ`を参考にしてください．

次のコードを冒頭に入力します．その下に出力したい内容を入力します．

```Typst
#import "./template-document.typ": *

#show: it => jarticle(
  title: "タイトル",
  author: "名前",
  it,
)
```

`jarticle`関数は次の引数が使えます．

### titlepage
タイトルページを作成するかを選択します．\
Default: `false`

### title
タイトル入力します．\
Default: `""`

### office
著者の所属を入力します．\
Default: `""`

### author
著者の名前を入力します．\
Default: `""`

### date
作成日を入力するか選択します．\
Default: `false`

## スライドの作成

`slide.typ`を参考にしてください．

次のコードを冒頭に入力します．その下に出力したい内容を入力します．

```Typst
#import "template-slide.typ": *

#show: it => slide-style(it)
```

タイトルスライドは次のように作成します．
```Typst
#title-slide(
  title: "タイトル",
  author: "名前",
)
```

スライドは次のように作成します．
```Typst
#slide(
  title: "タイトル"
)[
  内容
]
```

`slide`関数は次の引数が使えます．

### title
タイトル入力します．\
Default: `""`

### title-bgcolor
`rgb("#789ABC")`のように，タイトルの背景色をカラーコードで入力します．\
Default: `rgb("#DDDDFF")`

### verticaly
内容の配置を変えられます．`top`で上段揃え．`horizon`で中央揃え．`bottom`で下段揃え．\
Default: `horizon`