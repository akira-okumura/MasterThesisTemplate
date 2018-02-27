# 修士論文 LaTeX テンプレート
## このレポジトリについて
このレポジトリは、名古屋大学宇宙地球環境研究所の理学系修士学生が使用する __修士論文テンプレート__ です。あくまで作成例ですので、LaTeX を絶対に使う必要もありませんし、LaTeX を使うにしても、各自で好きな見た目を使うのも問題ありません。

このテンプレートで得られる修士論文の出力例は、PDF で[ここ](https://github.com/akira-okumura/MasterThesisTemplate/releases/download/v1.0.0/main.pdf)から見ることができます。宇宙地球環境研究所の学生向けと言っても、表紙のテンプレートがそのようになっているだけですので、他大学の学生の参考にもなると思います。`thesis_cover.sty` をちょこちょこっと編集すれば、好きな大学院用に変更できます。

テンプレートとしての役割以外に、LaTeX を使う上での注意点や、日本語の書き方の注意点を含んでいます。より細かい注意点は、[修士論文や夏の学校の集録や学振申請書を書く皆さんへ (書き方、注意点、心得)](http://oxon.hatenablog.com/entry/20130615/1371228320)を併せて参照してください。またこのテンプレート中の LaTeX コードをよく読み、どのように LaTeX を使えば良いか、注意して学んでください。

## Mac への LaTeX の導入
もし Homebrew が入っていないようであれば、[Homebrew](https://brew.sh/index_ja.html) を入れてください。

環境依存はちゃんと調べていませんが、Mac 上の TeX Live や MacTeX であれば動作するはずです。Mac OS は El Capitan 以降を仮定します。まず、Homebrew を使って MacTeX をインストールします。
```
$ brew cask install mactex
```

これで、MacTeX が入るはずです（2017 年 2 月現在、2016 年版が入ります）。MacTeX は A4 ではなく letter サイズが標準になっているので、これを A4 に変更します。

```
$ sudo tlmgr paper a4
```
    
次に出力される PDF にヒラギノフォントが埋め込まれるようにします。これをやらないと、作成した修士論文の見た目が、PDF を開く環境によって変わってしまいます（相手環境のフォントの有無で表示フォントが変わるため）。

```
$ cd /usr/local/texlive/2016/texmf-dist/scripts/cjk-gs-integrate
$ sudo perl cjk-gs-integrate.pl --link-texmf --force
$ sudo mktexlsr    
$ sudo kanji-config-updmap-sys hiragino-elcapitan-pron
```

Linux への日本語 LaTeX 環境構築は、ここ何年も自分がやった経験がないので、適当に検索してください。RHEL 系列であれば、yum で導入できるはずです。

## レポジトリのクローンと PDF ファイルの出力
LaTeX 環境が整ったら、このレポジトリを自分の Mac にクローンします。好きな場所で作業して構いません。
```
$ git clone https://github.com/akira-okumura/MasterThesisTemplate
```
次に、`make` コマンドを実行して LaTeX をコンパイルし PDF を出力します。`main.pdf` というファイルができるはずですので、これを開いてください。
```
$ cd MasterThesisTemplate
$ make
$ open main.pdf
```
※ `open` コマンドは Mac 特有のものです。

この`Makefile`の中では、LaTeX のコンパイルに`uplatex`を使用します。TeX Live や MacTeX などを導入すれば同梱されていると思います。

Mac の場合、[TeXShop](http://pages.uoregon.edu/koch/texshop/) を使うのを好む人もいるようなので、好みに応じて TeXShop でファイルを編集してください（TeXShop は Homebrew の MacTeX で一緒にインストールされます）。このテンプレートを使う場合は `platex` ではなく `uplatex` を使うように、TeXShop の環境設定を変更する必要があります。

また、`open main.pdf` というコマンドでは Preview や Acrobat Reader で PDF ファイルが開かれると思います。PDF の更新のたびに自動的に PDF を開き直したい場合は、[Skim](http://skim-app.sourceforge.net) を使うのが便利です。その場合は次のようにします。
```
$ open -a Skim main.pdf
```

論文本体の`main.pdf`の他に、宇宙地球環境研究所の論文提出時に必要となる次の 3 つの PDF も同時に生成されます。
- `cover_page.pdf`：バインダーに貼り付ける「正本」用の表紙
- `cover_page_copy.pdf`：バインダーに貼り付ける「副本」用の表紙- 1
- `ISEE_abstarct.pdf`：日本語の修士論文要旨（ここには、論文の題目や概要が自動的に LaTeX ファイルから流し込まれます）
