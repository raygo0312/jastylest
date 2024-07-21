# Typstの日本語テンプレート

Typstの日本語テンプレートを作成しました．修正点があればissueにあげるか，pull requestを送ってください．

## Typstのインストール

ここでは，VSCodeを用いたインストール方法を記載します．その他の方法は，
- Web版を使いたい場合 : [公式ページ](https://typst.app/)
- Terminal上で使いたい場合 : [GitHub](https://github.com/typst/typst)

を参照してください．

VSCodeにどちらかの拡張機能を入れます．
- Typst LSP (公式)
- Tinymist Typst (おすすめ)

このテンプレートを使用する場合は次のフォントをインストールしてもらう必要があります．再起動が必要かもしれません
- [原ノ味フォント](https://github.com/trueroad/HaranoAjiFonts)
- [COMPUTER MODERN](https://www.fontsquirrel.com/fonts/computer-modern)
- [katex-fonts](https://github.com/KaTeX/katex-fonts/tree/master)

具体的な使い方は[公式ドキュメント](https://typst.app/docs/)か解説ブログをご覧ください。

## テンプレートファイル

テンプレートファイルのimportには絶対パスを指定できないので，パッケージとしてあげます．詳しくは[こちら](https://github.com/typst/packages?tab=readme-ov-file#local-packages)を参照してください．
1. dataディレクトリに`typst/packages/local/japanese-template/0.1.0/typst.toml`を作成します．
1. 以下のコードを入力します．
1. `typst.toml`と同じディレクトリ内にこのリポジトリを`template`という名前でシンボリックリンクを作成します．
```toml
[package]
name = "japanese-template"
version = "0.1.0"
entrypoint = "template/template.typ"
authors = ["raygo"]
```

## Tinymistの使い方
詳しくは[こちら](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)を参照してください．
- 右上の虫眼鏡がついているアイコンをクリックするとプレビューが開きます．
- typstファイルの先頭にある`Export PDF`をクリックするとPDFに変換されます．
- 設定ファイルに`"tinymist.formatterMode": "typstyle"`を書き込むとフォーマットされます．


## ドキュメントの作成

`main.typ`を参考にしてください．

次のコードを冒頭に入力します．その下に出力したい内容を入力します．

```Typst
#import "@local/japanese-template:0.1.0": *

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
#import "@local/japanese-template:0.1.0": *

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