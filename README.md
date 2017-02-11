# MasterThesisTemplate
## このレポジトリについて
このレポジトリは、名古屋大学宇宙地球環境研究所の理学系修士学生が使用する修士論文テンプレートです。あくまで作成例ですので、LaTeX を絶対に使う必要もありませんし、LaTeX を使うにしても、各自で好きな見た目を使うのも問題ありません。

宇宙地球環境研究所の学生向けと言っても、表紙のテンプレートがそのようになっているだけですので、他大学の学生の参考にもなると思います。

テンプレートとしての役割以外に、LaTeX を使う上での注意点や、日本語の書き方の注意点を含んでいます。より細かい注意点は、[修士論文や夏の学校の集録や学振申請書を書く皆さんへ (書き方、注意点、心得)](http://oxon.hatenablog.com/entry/20130615/1371228320])を併せて参照してください。

## Mac への LaTeX の導入
もし Homebrew が入っていないようであれば、Homebrew を入れてください。

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
