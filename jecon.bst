% jecon.bst: 経済学用 BibTeX style file.
%
% First-written:       <2002/11/03>
% Time-stamp:	       <2016-08-28 13:40:17 st>
% Version 5.1.1
%
% これは，飯田修さんによって作成された jpolisci.bst を経済学用に
% 武田史郎が改変したものです．
% 改変には
%
% aer.bst, jfm.bst, jplain.bst
% 萩平哲さんによる <http://www.med.osaka-u.ac.jp/pub/anes/www/html/manual/bibtex.html>
% 樋口耕一さんによる nissya.bst <http://koichi.nihon.to/psnl/>
%
% 等を参考にさせていただきました。これらの有益なプログラム、ページを作成してくだ
% さった方々に感謝します。
%
% 元の jpolisci.bst の著作権は飯田さんにあります．わたしが改変した部分の著作権は
% どうでもいいです．好きなように扱ってください．
%
% オリジナルの jpolisci.bst は，<http://www.bol.ucla.edu/~oiida/jpolisci/> で入手
% することができます．(注：2006年現在ではもうこのページは存在しないようです．どこ
% で入手できるかはわかりません)．
%
% コメント，要望は武田史郎まで．
%
% 変更履歴 (Changelog) は CHANGES.txt ファイルを見てください．

% version 指定
FUNCTION {jecon.version} { "5.1.1" }

% Debug mode．0 以外を指定すると様々な情報を表示させることが可能．
FUNCTION {jecon.debug}
{ #0 }    % Debug mode off.
% { #1 }    % Debug mode on.


% 以下は元の jpolisci.bst のヘッダー部分です．
%
%%%%%% ここから Original header.
%
% JPOLISCI: a bibliography style for papers in political sicence
%           and other fields that cite Japanese literature.
%           Vertical writing (tate-gaki) compatible.

	% Version 20000910 for JBibTeX versions 0.30 or later,
        % and pLaTeX2e or later.
	% Copyright (C) 2000, all rights reserved.
	%
	% This file was derived from jbtxbst.doc.
	%
	% Copying of this file is authorized only if either
	% (1) you make absolutely no changes to your copy, including name, or
	% (2) if you do make changes, you name it something other than
	% jbtxbst.doc, jplain.bst, junsrt.bst, jalpha.bst, jabbrv.bst,
	% tipsj.bst, jipsj.bst, tieice.bst, jname.bst, jorsj.bst, jglsj.bst,
        % seg.bst, jpolisci.bst.
	%
	% This restriction helps ensure that all standard styles are identical.
	% The file jbtxbst.doc has the documentation for this style.
	%

        % Author:
        %
        % 飯田修 Osamu Iida
        % email: oiida@newmail.net
        % URL  : http://www.bol.ucla.edu/~oiida/jpolisci/ (in Japanese)
        %
        % Bug reports, technical suggestions and any other comments
        % will be appreciated.
        % 

        % Acknowledgement:
        %
        % The following files were referred to while creating this file:
        %
        %   jglsj.bst  (by 千葉智章 Tomoaki Chiba)
        %     Function "format.lab.name" in jpolisci.bst derived from
        %     it with small modifications only. The author appreciates it.
        %
        %   seg.bst (by Martin Karrenbach)
        %     A method for making two sorts of labels is based on this
        %     file's feats.
        %
        %   jalpha.bst (by 松井正一 Shoichi Matsui)
        %     jpolisci.bst principally owes its functionality to it.
        %
        %   藤田眞作『続 LaTeX2e 階梯・縦組編』（アジソン・ウェスレイ、1998 年）。
        %
        % Friends in BBSes at IR-web <http://pws.prserv.net/oi/ -- now
        % obsolete> and KH's Web Site <http://home.att.ne.jp/wind/polisci/>
        % gave me titles of Japanese political science journals which are
        % included in MACROs.

        % This file is distributed with absolutely no warranty.
        % The author doesn't assume any kind of responsibility for
        % any inconvenience caused by using this file.

        % Last modified: 2000/12/05

%%%%%% Original header ここまで。
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	用語

%% 「エントリー」：一つの文献のこと．エントリーのタイプとは article，book 等の
%% 文献の種類のこと．

%% 「フィールド」：エントリー内で指定されている title, author, year 等のこと．

%% 「キーワード」：\cite命令の引数となる各エントリーに指定されている文字列のこ
%% と．

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \bysame を使うか否か。使わないなら 0、使うなら 0 以外を指定 (bst ファイ
% ルでは整数を表すとき数字に # を付ける)。
% \bysame とは、参考文献部分同じ著者名が連続するときに --- で省略するもの。
%
FUNCTION {bst.use.bysame}
% { #0 }    % Not use \bysame
{ #1 }    % -> Use \bysame (default)
% { #2 }    % -> Use \bysame of alternative style.

% \bysame の定義。\bysame を使ったときの横棒の形式を変えるには以下の定義を修正
% する。
%
FUNCTION {bst.bysame.definition}
{ "\hskip.3em \leavevmode\rule[.5ex]{2.5em}{.3pt}\hskip0.5em" } 

% 日本語文献用の \bysame （\bysamejp）の定義
% とりあえず英語文献用と同じ定義にしておく。
FUNCTION {bst.bysame.definition.jp}
{ "\hskip.2em \leavevmode\rule[.7ex]{2.5em}{.3pt}\hskip0.3em" } 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Economics の reference では, first author 名は「姓, 名」の順番で表記し、
% second author 以下は「名 姓」とするという場合が多いが、これを変更するための関数。
% Editor にも適用。日本語文献は関係なし。#0 か #1 か #2 を選択可。
%
FUNCTION {bst.author.name}
% { #0 }    % (default)
{ #1 }
% { #2 }

% [#0 のケース] これ普通の経済学風。
% Fujita, Masahisa, Paul R. Krugman, and Anthony J. Venables. 

% [#1 のケース] 全員「姓, 名」のケース。
% Fujita, Masahisa, Krugman, Paul R., and Venables, Anthony J.

% [#2 のケース] 全員「名 姓」のケース。
% Masahisa Fujita, Paul R. Krugman, and Anthony J. Venables.

% Economics の reference では, first author 名は「姓, 名」の順番で表記し、
% second author 以下は「名 姓」とするという場合が多いが、これを変更するための関数。
% Editor にも適用。日本語文献は関係なし。#0 か #1 か #2 を選択可。
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% bibファイルにおける日本人名の記述方法の選択。
%
% 普通のbibファイルでは日本人名は「author = {姓 名}」という書き方をする。しかし、
% 一部の文献管理ソフトは日本人名を「author = {姓, 名}」という形式でbibファイルに
% 出力する。bibファイルがこのどちらの形式で記述されているかの選択。editor、yomi、
% jauthorにも同じ選択が適用されます。詳しくはjecon-sample.pdfで。
%
FUNCTION {bst.sei.mei.order}
% { #0 }    % (default) 普通の書き方 → author = {武田 史郎} or author = {史郎, 武田}
{ #1 }    % 逆の書き方 → author = {武田, 史郎} or author = {史郎 武田} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Author (editor) 名の first name を頭文字だけに略す。
%
FUNCTION {bst.first.name.initial}
% { #0 }    % #0 -> 略さない。 (default)
{ #1 }    % #0 以外 -> first name を頭文字に略す。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title の先頭文字以外を小文字に変換する (book の tile は除く。元々小文
% 字ならなにも変わらない)。
%
FUNCTION {bst.title.lower.case}
{ #0 }    % #0 なら小文字に変換しない (そのまま)  (default)
% { #1 }    % #0 以外なら、小文字に変換する。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title を表示するかしないか．
%
FUNCTION {bst.hide.title}
{ #0 }    % #0 -> 表示する．普通はこちら． (default)
% { #1 }    % #0 以外 -> 隠す (表示しない)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 同じ年に同じ著者の英語、日本語文献の両方があり、かつ日本語文献の yomi
% に英語文献の著者と同じものが指定してあるときに、両者を混ぜて表示するた
% めのオプション。
% yomiを日本語で書いているなら関係なし．
FUNCTION {bst.mixed.order}
{ #0 }    % #0 -> 混ぜない．普通はこちら． (default)
% { #1 }    % #0 以外 -> 混ぜる。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% month を表示するか否か。隠す(表示しない)なら 0 以外、隠さない(表示する)なら 
% 0 を指定。隠す場合でも month フィールドの値は並べ替えのキーとしては利用され
% る。これも普通は変更しない．
FUNCTION {bst.hide.month}
% { #0 }    % #0 -> 表示する．普通はこちら． (default)
{ #1 }    % #0 以外 -> 隠す (表示しない)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% number filed を表示するか否か。隠す(表示しない)なら 0 以外、隠さない(表示す
% る)なら 0 を指定。これも普通は変更しない．
FUNCTION {bst.hide.number}
{ #0 }    % #0 -> 表示する．普通はこちら． (default)
% { #1 }    % #0 以外 -> 隠す (表示しない)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% これの値に 0 以外を指定すると、reference 部分で plain.bst のように文献
% の前に number index ([1]のようなもの)を付けることができる (引用部分は
% author-yearで変わらない)。
%
FUNCTION {bst.use.number.index}
% { #0 }    % Not use number index  (default)
{ #1 }    % #0 以外 -> Use number index

% number index の前に付ける文字列 (bst.use.number.indexに0以外を指定していると
% きのみ有効)．
%
FUNCTION {bst.number.index.pre}
{ "[" }    % (default) 

% number index の後に付ける文字列。 \hskip1.0em は空白の大きさ。空白の長さは自
% 分で調整したほうがよい。 (bst.use.number.indexに0以外を指定しているときのみ
% 有効)．
FUNCTION {bst.number.index.post}
{ "]\hskip1.0em " }    % (default)

% number index の最大の桁数 (文献が100個以上なら3、100個より少ないなら2、10個よ
% り少なければ1を指定)。とりあえず 3 を指定しておけば問題ないが、3 だとインデン
% トが大き目になる。値は 1, 2, 3 のどれかを指定．
%
FUNCTION {bst.number.index.digit}
{ "3" }    % (default)

% 以下は、number index を表示するときに見た目を調整するための関数。computer
% modern 以外のフォントを使用するようなときは要調整。
%
% Reference 部分の文献の2行目以降のインデント幅の値を指定．
%
% bst.number.index.digit の値によってインデント幅は変わるので，それぞれのケース
% について指定する．
%
% bst.number.index.digit = 1 のときの設定
FUNCTION {bst.number.index.bibhang.one}
{ "2.05em" }    % (default)
% bst.number.index.digit = 2 のときの設定
FUNCTION {bst.number.index.bibhang.ten}
{ "2.55em" }    % (default)
% bst.number.index.digit = 3 のときの設定
FUNCTION {bst.number.index.bibhang.hund}
{ "3.05em" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ユニコード文字を利用するときには非ゼロにする。
% 使い方については「jecon_unicode_xelatex.pdf」を見てください。
% 
FUNCTION {bst.use.unicode}
{ #0 }    % Not use unicode font (default)
% { #1 }    % Use unicode font

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 日本語文献の数字を漢数字にする．
%
% 縦書き用です．
%
% 0 以外なら漢数字に変換。
FUNCTION {bst.kansuji.jp}
{ #0 }    % 変換しない。(default)
% { #1 }    % 漢数字に変換する。

% bst.kansuji.jp が非ゼロのときに，pages でのページ数とページ数を結ぶ線の定義
% を指定する．pages = 100-200 と指定しているときに，"-" に置き換わる線の定義．
%
% 縦書きの表示を指定しているときでも - は横棒のまま表示されます．これを縦棒に
% 表示するための指定です．
% 
FUNCTION {bst.tatebo.definition}
{ "\hskip.1em \leavevmode\rule[0ex]{1em}{.3pt}\hskip0.1em" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% year の表示位置を変更。
%
% この関数でyearが表示される位置を変更できます。
%
% #0 ->  yearは author のすぐ後に表示されます。
% 非ゼロ -> article タイプ以外では year は 最後（note フィールドの前）に表示されます。
%
% Article タイプのエントリーでは次のように変わります。
% 
% #1 -> year は最後に表示されます。
% #2 -> year は journal name の後に表示されます。
% #3 -> year は volume の後に表示されます。
%
FUNCTION {bst.year.position}
{ #0 }    % autho のすぐ後 (default).
% { #1 }    % 最後（note の前）
% { #2 }    % journal name の後（article entryのみ）
% { #3 }    % volume の後（article entryのみ）

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 0 以外を指定すると新しい年の文献を前にもってくる。
%
% 0 なら普通の並び順。通常は 0 のままでいいでしょう．
%
FUNCTION {bst.reverse.year}
{ #0 }    % 普通の並び順 (古い文献ほど上) (default)
% { #1 }    % 普通とは逆 (新しい文献ほど上)

% 0 以外なら year を優先的なキーとしてソート(並べ替え)をする。
% 
% 普通では古い文献ほど上に並べられるが、bst.reverse.year が非ゼロなら新しい文
% 献ほど上となる。
%
FUNCTION {bst.sort.year}
{ #0 }    % この場合、year は author に次ぐソートのキー (普通のケース) (default)
% { #1 }    % この場合、year は最優先されるソートのキー

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 引用順で参考文献を並べる設定．
%
% 0 以外を指定すると引用をしたそのままの順で reference に文献を並べる．\bysame 
% と一緒に利用すると表示がおかしくなるケースあり．
%
FUNCTION {bst.no.sort}
{ #0 }    % 文献の順番を普通にソートする．(default)
% { #1 }    % 引用順に並べる．

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき文献エントリーのタイプ別 (article, book, incollection 等)
% にまとめるための設定．
%
FUNCTION {bst.sort.entry.type}
{ #0 }    % #0 -> タイプ別にまとめない．(default)
% { #1 }    % まとめる．
%
% この設定は absorder よりも優先します．どういう順番で並べるか (article, book,
% incollection 等をどう並べるか) は bst.sort.entry.type.order という関数の設定
% で決まります．デフォールトでは alphabet 順にしてあります (article, book,
% booklet, comment,..., unpublished 順)．詳しくは jecon-sample.pdf を参照。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき absorder filed の値を利用するか否か。利用するなら
% 0、利用しないなら 0 以外を指定。
%
FUNCTION {bst.notuse.absorder.field}
{ #0 }    % #0 -> 利用する。(default)
% { #1 }    % #0 以外 -> 利用しない。
%
% Reference での文献並べ替えの優先順序については 
% 
% absorder -> author (or yomi) -> year -> order -> month -> title
%
% としてある。詳しくは jecon-sample.pdf を参照。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき order filed の値を利用するか否か。利用するなら
% 0、利用しないなら 0 以外を指定。
FUNCTION {bst.notuse.order.field}
{ #0 }    % #0 -> 利用する。(default)
% { #1 }    % #0 以外 -> 利用しない。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	and

%%% 二人の authors, editors の間の文字列
%
% "Mr.A _ Mr.B " の "_" の部分に入る文字列
%
FUNCTION {bst.and}
{ " and " }    % (default)

%%% 三人以上の authors, editors の間の文字列
%
% "Mr.A, Mr.B _ Mr.C" の "_" の部分に入る文字列
%
FUNCTION {bst.ands}
{ ", and " }    % (default)

% 複数の authors, editors の間の文字列 (日本語文献用)
%
% "A氏 _ B氏 _ C氏" の "_" の部分に入る文字列
%
FUNCTION {bst.and.jp}
{ "・" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	「引用部分」での author 名の間に入る文字列

%%% 二人の authors, editors の間の文字列
%
% 引用部分の "Mr.A _ Mr.B " の "_" の部分に入る文字列
%
FUNCTION {bst.cite.and}
{ " and " }    % (default)

%%% 三人以上の authors, editors の間の文字列
%
% 引用部分の "Mr.A, Mr.B _ Mr.C" の "_" の部分に入る文字列
%
FUNCTION {bst.cite.ands}
{ " and " }    % (default)

% 複数の authors, editors の間の文字列 (日本語文献用)
%
% 引用部分の "A氏 _ B氏 _ C氏" の "_" の部分に入る文字列
%
FUNCTION {bst.cite.and.jp}
{ "・" }    % (default)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 何人以上の著者がいるときに引用部分で et al.で省略するか。3人以上のとき
% に略すときは #3 を指定。
FUNCTION {bst.and.others.num}
{ #3 }    % 3人以上なら省略する。(default)
% { #4 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	author 名を略す際の文字列

%%% 英語用
%
FUNCTION {bst.and.others}
{ " et~al." }    % (default)

%%% 日本語用
%
FUNCTION {bst.and.others.jp}
{ "他" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	author 

% author の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.author.pre}
{ "" }    % (default)

% author の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.author.post}
{ "" }    % (default)

% author の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.author.pre.jp}
{ "" }    % (default)

% author の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.author.post.jp}
{ "" }    % (default)

%%% 日本語文献の author, editor の姓・名の間に入れる文字列 
% (姓名のどちらか一方が一文字のケース)
%
FUNCTION {bst.sei.mei.one.jp}
{ "" }    % (default)
% { "　" }

%%% 日本語文献の author, editor の姓・名の間に入れる文字列 
% (姓・名とも二文字以上のケース)
%
FUNCTION {bst.sei.mei.two.jp}
{ "" }    % (default)
% { " " }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	year

% year の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.year.pre}
% { " (" }    % (default)
{ " " }    % (default)

% year の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.year.post}
% { ") " }    % (default)
{ " " }    % (default)

% year の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.year.pre.jp}
%{ " (" }    % (default)
{ " " }    % (default)

% year の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.year.post.jp}
% { ") " }    % (default)
{ " " }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	title (book 以外)

% title の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.title.pre}
{ "``" }    % (default)

% title の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.title.post}
{ ",''" }    % (default)

% title の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.title.pre.jp}
{ "「" }    % (default)

% title の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.title.post.jp}
{ "」，" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	book 用 title

% book の title 前に付ける文字列 (英語文献用)
%
FUNCTION {bst.book.pre}
{ " \textit{ " }    % (default)

% book の title 後に付ける文字列 (英語文献用)
%
FUNCTION {bst.book.post}
{ "}" }    % (default)

% book の title 前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.book.pre.jp}
{ "『" }    % (default)

% book の title 後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.book.post.jp}
{ "』" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	booktitle

% booktitle の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.btitle.pre}
{ " \textit{ " }    % (default)

% booktitle の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.btitle.post}
{ "}" }    % (default)

% booktitle の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.btitle.pre.jp}
{ "『" }    % (default)

% booktitle の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.btitle.post.jp}
{ "』" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	journal name

% journal name の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.journal.pre}
{ " \textit{ " }    % (default)

% journal name の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.journal.post}
{ "}" }    % (default)

% journal name の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.journal.pre.jp}
{ "『" }    % (default)

% journal name の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.journal.post.jp}
{ "』" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	editor 記号

% 複数 editor を表す文字列 (英語文献用)
%
FUNCTION {bst.editors}
{ " eds. " }    % (default)

% 一人の editor を表す文字列 (英語文献用)
%
FUNCTION {bst.editor}
{ " ed. " }    % (default)

% editor を表す文字列 (日本語文献用)
%
FUNCTION {bst.editor.jp}
{ "（編）" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	kanyaku (監訳者)

% kanyaku の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.kanyaku.pre.jp}
{ "，" }    % (default)

% kanyaku の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.kanyaku.post.jp}
{ "監訳" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	translator (翻訳者)

% translator の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.translator.pre.jp}
{ "，" }    % (default)

% translator の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.translator.post.jp}
{ "訳" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	edition

% edition の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.edition.pre}
{ ", " }    % (default)

% edition の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.edition.post}
{ " edition" }    % (default)

% edition の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.edition.pre.jp}
{ "，第" }    % (default)

% edition の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.edition.post.jp}
{ "版" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	volume

% volume の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.volume.pre}
% { ", Vol. " }    % (default)
{ " {\bf " }    % (default)

% volume の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.volume.post}
% { "" }    % (default)
{ "}" }    % (default)

% volume の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.volume.pre.jp}
{ "，第" }    % (default)

% volume の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.volume.post.jp}
{ "巻" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	number

% number の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.number.pre}
{ ", No. " }    % (default)

% number の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.number.post}
{ "" }    % (default)

% number の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.number.pre.jp}
{ "，第" }    % (default)

% number の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.number.post.jp}
{ "号" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	in 

% In (英語文献用)
%
FUNCTION {bst.in}
{ " in " }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	page

% page の前に付ける文字列 (複数ページ) (英語文献用)
%
FUNCTION {bst.pages.pre}
% { ", pp." }    % (default)
{ ", " }    % (default)

% page の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.page.pre}
% { ", p." }    % (default)
{ ", " }    % (default)

% page の後に付ける文字列 (複数ページ) (英語文献用)
%
FUNCTION {bst.pages.post}
{ "" }    % (default)

% page の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.page.post}
{ "" }    % (default)

% page の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.page.pre.jp}
{ "，" }    % (default)

% page の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.page.post.jp}
{ "頁" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	chapter

% chapter の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.chapter.pre}
{ ", Chap." }    % (default)

% chapter の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.chapter.post}
{ "" }    % (default)

% chapter の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.chapter.pre.jp}
{ "，第" }    % (default)

% chapter の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.chapter.post.jp}
{ "章" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	month

% month の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.month.pre}
{ ", " }    % (default)

% month の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.month.post}
{ "" }    % (default)

% month の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.month.pre.jp}
{ "，" }    % (default)

% month の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.month.post.jp}
{ "月" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	address
% address の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.address.pre}
{ ", " }    % (default)

% address の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.address.post}
{ "" }    % (default)

% address の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.address.pre.jp}
{ "，" }    % (default)

% address の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.address.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	publisher

% publisher の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.publisher.pre}
{ ": " }    % (default)

% publisher の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.publisher.post}
{ "" }    % (default)

% publisher の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.publisher.pre.jp}
{ "，" }    % (default)

% publisher の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.publisher.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	series

% series の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.series.pre}
{ ", " }    % (default)

% series の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.series.post}
{ "" }    % (default)

% series の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.series.pre.jp}
{ "，" }    % (default)

% series の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.series.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	organization

% organization の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.organization.pre}
{ ", " }    % (default)

% organization の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.organization.post}
{ "" }    % (default)
% organization の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.organization.pre.jp}
{ "，" }    % (default)

% organization の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.organization.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	school

% school の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.school.pre}
{ ", " }    % (default)

% school の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.school.post}
{ "" }    % (default)

% school の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.school.pre.jp}
{ "，" }    % (default)

% school の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.school.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	institution

% institution の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.institution.pre}
{ ", " }    % (default)

% institution の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.institution.post}
{ "" }    % (default)

% institution の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.institution.pre.jp}
{ "，" }    % (default)

% institution の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.institution.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	howpublished

% howpublished の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.howpublished.pre}
{ " " }    % (default)

% howpublished の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.howpublished.post}
{ "" }    % (default)

% howpublished の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.howpublished.pre.jp}
{ "，" }    % (default)

% howpublished の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.howpublished.post.jp}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       url

% URLフィールド．非ゼロを指定するとURLが表示される．ゼロのときは非表示．
FUNCTION {bst.show.url}
{ #1 }    % non-#0 -> URLを表示 (default)
% { #0 }    % #0 -> URLを非表示

% URLの前に付ける文字列 (英語文献用)
%
FUNCTION {bst.url.pre}
{ ", URL: \url{" }	% (default)

% URLの後に付ける文字列 (英語文献用)
%
FUNCTION {bst.url.post}
{ "}" }    % (default)

% URLの前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.url.pre.jp}
{ "，URL：\url{" }	% (default)

% URLの後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.url.post.jp}
{ "}" }    % (default)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Access

% Accessフィールド．accessフィールドはURLにアクセスした日付けを指定しておく．こ
% れは普通のbibファイルにはないフィールド．

% accessの前に付ける文字列 (英語文献用)
%
FUNCTION {bst.access.pre}
{ ", accessed on " } % (default)

% accessの後に付ける文字列 (英語文献用)
%
FUNCTION {bst.access.post}
{ "" }    % (default)

% accessの前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.access.pre.jp}
{ "（アクセス日: " } % (default)

% accessの後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.access.post.jp}
{ "）" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       DOI (digital object identifier)

% DOIフィールド．DOIを指定．これも普通のbibファイルにはないフィールド．

% 非ゼロならDOIを表示．ゼロなら非表示．
FUNCTION {bst.show.doi}
{ #1 }    % non-#0 -> Show DOI field (default)
% { #0 }    % #0 -> Not show DOI field.

% DOIの前に付ける文字列 (英語文献用)
%
FUNCTION {bst.doi.pre}
{ ", DOI: \url{http://dx.doi.org/" } % (default)

% DOIの後に付ける文字列 (英語文献用)
%
FUNCTION {bst.doi.post}
{ "}" }    % (default)

% DOIの前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.doi.pre.jp}
{ "，DOI: \url{http://dx.doi.org/" } % (default)

% DOIの後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.doi.post.jp}
{ "}" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	邦訳書

FUNCTION {bst.hoyakusho.pre.jp}
{ "（" }    % (default)

FUNCTION {bst.hoyakusho.post.jp}
{ "）" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 句点の指定．
FUNCTION {bst.kuten.jp}
{ "．" }    % (default)

% 読点の指定．
FUNCTION {bst.touten.jp}
{ "，" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	
% 0 以外を指定すれば，page を繋ぐ "-" を "--" に変更しない．
FUNCTION {bst.dashify.off}
% { #0 }
{ #1 }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 非ゼロを指定すると \harvarditem を出力しない．
FUNCTION {bst.harvarditem.off}
{ #0 }    % (default)
% { #1 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	\thebibliography環境の定義
%
% thebibliography命令の前や後に何かを入れたいときは変更してください．
%
FUNCTION {bst.thebibliography.begin}
{
  "" write$ newline$
  "\begin{thebibliography}{xxx}" write$ newline$
  "" write$ newline$
}

FUNCTION {bst.thebibliography.end}
{ 
  "" write$ newline$
  "\end{thebibliography}" write$ newline$
  "" write$ newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	その他の関数

% noteの前に付ける文字列 (英語文献用)
%
FUNCTION {bst.note.pre}
{ ", " }    % (default)

% noteの後に付ける文字列 (英語文献用)
%
FUNCTION {bst.note.post}
{ "" }    % (default)

% noteの前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.note.pre.jp}
{ "，" }    % (default)

% noteの後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.note.post.jp}
{ "" }    % (default)

% Technical report を表す文字列 (英語文献用)
%
FUNCTION {bst.techrep}
{ " Tech. Rep." }    % (default)

% Technical report を表す文字列 (日本語文献用)
%
FUNCTION {bst.techrep.jp}
{ " テクニカル・レポート" }    % (default)

% master thesis を表す文字列 (英語文献用)
%
FUNCTION {bst.mthesis}
{ " Master's thesis" }    % (default)

% master thesis を表す文字列 (日本語文献用)
%
FUNCTION {bst.mthesis.jp}
{ "修士論文" }    % (default)

% phd thesis を表す文字列 (英語文献用)
%
FUNCTION {bst.phdthesis}
{ " Ph.D. dissertation" }    % (default)

% phd thesis を表す文字列 (日本語文献用)
%
FUNCTION {bst.phdthesis.jp}
{ "博士論文" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数はここまで。
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 以下は英語文献用

FUNCTION {bst.first}
{ "1st" }

FUNCTION {bst.second}
{ "2nd" }

FUNCTION {bst.third}
{ "3rd" }

FUNCTION {bst.fourth}
{ "4th" }

FUNCTION {bst.fifth}
{ "5th" }

FUNCTION {bst.st}
{ "st" }

FUNCTION {bst.nd}
{ "nd" }

FUNCTION {bst.rd}
{ "rd" }

FUNCTION {bst.th}
{ "th" }

%%%%% memo by Takeda

% "a" 'b := は b という変数に "a" という文字列を代入するということ。

% #0 は整数の 0、#1 は整数の 1．．．を表す。

%%% 関数の書式
%
% FUNCTION {name}
% { 's :=
%
% }
%
% 上は name という関数の定義。呼出し側では
%
% "hoge" name
%
% という形で指定。"hoge" という文字列が、変数 s に代入される。
%
% 引数が二つ以上の関数の定義 --> 関数 chop.word を参照。

ENTRY

  %%% 文献フィールドの宣言
  { access address author booktitle chapter doi edition editor howpublished
    institution journal key month note number organization pages publisher
    school series title type url volume year yomi language

    % 以下は普通の bst ファイルでは利用されないフィールド
    jauthor jkanyaku jtitle jpublisher jyear
    order absorder translator kanyaku
  }

  % 以下，エントリー変数の定義．エントリー変数とは，文献エントリー別に異なっ
  % た値を持つ変数のこと．

  %% これは entry 別の整数型変数 (整数型エントリ変数)
  { is.kanji.entry is.kanji.entry.two order.cited is.kanji.entry.author }

  %% これは entry 別の文字列型変数 (文字列型エントリ変数)
  { label cyear flabel alabel extra.label sort.label sort.label.abb
    extra.label.bysame }

%%% 変数宣言

%% 文字列型大域変数
STRINGS { s t ss tt sss }
STRINGS { year.num }
STRINGS { num.kanji }
STRINGS { preone preten }
STRINGS { last.sort.label next.extra this.author prev.author prev.author.jecon }
STRINGS { hang }
STRINGS { item.type }
STRINGS { tempa tempb tempc }

%% 整数型大域変数
INTEGERS { nameptr namesleft numnames  alphabet.in.author name.num }
INTEGERS { bysame.check }
INTEGERS { multiresult }
INTEGERS { index }
INTEGERS { len }
INTEGERS { last.extra.num }
INTEGERS { output.state before.all mid.sentence after.sentence after.block int }
INTEGERS { last.period.comma }
INTEGERS { len1.jecon len2.jecon i.jecon }

%%% 変数の説明

% alabel: 引用部分で利用される author (editor) 名 (省略形)を保持する変数． 
% reference 部分の表示には無関係．

% flabel: 引用部分で利用される author (editor) 名を保持する変数． reference 部
% 分の表示には無関係．

% sort.label: 文献のソートのための author (editor) 名を保持する変数．

% sort.label.abb: 文献のソートのための author (editor) 名を保持する変数．こちら
% は abbreviated name での表現．

% sort.key$: 文献のソート (並べ替え) のために利用される文字列を保持する．
% jecon.debug を非ゼロにすればどのような値が入っているか表示できる (通常は 
% author - year - title - month 等が繋った文字列が指定される)．

% extra.label: 著者名が同じときに年に付けるアルファベット。

% 以下は Type 1 の bysame を利用するときに使う変数。
% 
% this.author: 現在の author (or editor) を入れる変数
% prev.author: 一個前の author (or editor) を入れる変数
% extra.label.bysame:
% これはエントリー変数。bysame を利用する文献の場合には、"bysame" を入れる。

% 以下は Type 2 の bysame を利用するときに使う変数。
% 
% prev.author.jecon: 一個前の author (or editor) を入れる変数
% len1.jecon len2.jecon i.jecon


%%% 汎用の関数の定義

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

%%% 変数の値を初期化する関数
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

%%% comma を除去し、period を付ける(に変える)関数 (英語文献用)
%
% #-1 #1 substring$ は後ろから一文字目を抜き出す処理をする。
%%%
FUNCTION {add.period.x}
{ duplicate$
  % 後ろから1文字とって比較
  #-1 #1 substring$ "," =
    { #-2 global.max$ substring$ "." * }
    { duplicate$
      % 後ろから2文字とって比較
      #-1 #2 substring$ ". " =
        { #-3 global.max$ substring$ "." * }
        { duplicate$
          #-1 #2 substring$ ". " =
            { #-3 global.max$ substring$ "." * }
            { duplicate$
              #-1 #2 substring$ ",'" =
                { #-3 global.max$ substring$ ".'" * }
                { duplicate$
                  #-1 #2 substring$ ".'" =
                    { #-3 global.max$ substring$ ".'" * }
                    { duplicate$
                      #-1 #2 substring$ ".~" =
                        { #-3 global.max$ substring$ ".~" * }
                        { duplicate$
                          #-1 #2 substring$ ",~" =
                          { #-3 global.max$ substring$ ".~" * }
                          { duplicate$
                            % 後ろから3文字とって比較
                            #-1 #3 substring$ ",''" =
                              { #-4 global.max$ substring$ ".''" * }
                              { duplicate$
                                #-1 #3 substring$ ".''" =
                                  { #-4 global.max$ substring$ ".''" * }
                                  { add.period$ }
                                if$
                              }
                            if$
                          }
                        if$
                      }
                    if$
                  }
                if$
              }
            if$
          }
        if$
      }
     if$
   }
  if$
}

%%% "、" や "，" を除去し、"．" を付ける(に変える)関数 (日本語文献用)
FUNCTION {add.kanji.period.x}
{
  duplicate$
  % 後ろから1文字とって比較
  #-1 #1 substring$ "，" =
    { #-2 global.max$ substring$ bst.kuten.jp * }
    { duplicate$
      % 後ろから1文字とって比較
      #-1 #1 substring$ "、" =
        { #-2 global.max$ substring$ bst.kuten.jp * }
        { duplicate$
          % 後ろから1文字とって比較
          #-1 #1 substring$ "." =
            {#-2 global.max$ substring$ bst.kuten.jp * }
	    {#-1 global.max$ substring$ bst.kuten.jp * }
          if$
        }
     if$
   }
  if$
}

%%% 最後の文字が period or comma かどうかを判定。 period or comma の場合には
%%% last.period.comma に非ゼロを代入する。 
INTEGERS { comma.period.a.p comma.period.b.p }
STRINGS { pc }
FUNCTION {period.comma.a.p}
{ 'pc :=
  pc #-1 #1 substring$ "." = 
  pc #-1 #1 substring$ "," = or
  pc #-1 #2 substring$ ". " = or
  pc #-1 #2 substring$ ", " = or
  pc #-1 #2 substring$ ".'" = or
  pc #-1 #2 substring$ ",'" = or
  pc #-1 #3 substring$ ".''" = or
  pc #-1 #3 substring$ ",''" = or
    { #1 'comma.period.a.p := }
    { #0 'comma.period.a.p := }
  if$
}

FUNCTION {period.comma.b.p}
{ 'pc :=
  pc #-1 #3 substring$ ".' " =
  pc #-1 #3 substring$ ",' " = or
  pc #-1 #4 substring$ ".'' " = or
  pc #-1 #4 substring$ ",'' " = or
  pc #-1 #2 substring$ ".~" = or
  pc #-1 #2 substring$ ",~" = or
  pc #-1 #1 substring$ "。" = or
  pc #-1 #1 substring$ "．" = or
  pc #-1 #1 substring$ "、" = or
  pc #-1 #1 substring$ "，" = or
    { #1 'comma.period.b.p := }
    { #0 'comma.period.b.p := }
  if$
}

% 直近の field が period or comma で終っているか判断。終っていたら
% last.period.comma に #1 を代入。
FUNCTION {period.comma.p}
{ duplicate$ 't :=
  t period.comma.a.p
  t period.comma.b.p
  comma.period.a.p #1 =
  comma.period.b.p #1 = or
    { #1 'last.period.comma := }
    { #0 'last.period.comma := }
  if$
}

%%% 文字列の最初についている comma or period を除去した文字列を返す。
FUNCTION {remove.pre.comma.period}
{ 's :=
  s empty$
    { "" }
    %% ascii character
    { s #1 #1 substring$ "," =
      s #1 #1 substring$ "." = or
       { s #2 global.max$ substring$ }
       %% multi-byte character
       { s #1 #2 substring$ "，" =
         s #1 #2 substring$ "、" = or
         s #1 #2 substring$ "。" = or
         s #1 #2 substring$ "．" = or
          { s #3 global.max$ substring$ }
          's
         if$
       }
      if$
    }
  if$
}

%
% 
%
FUNCTION {output.nonnull.nocomma}
{ 's :=
  output.state mid.sentence =
    % mid.sentence のとき。 
    { % ついでに直近の field が period or comma で終っているか判断。
      period.comma.p
      % pop して書き込み。
      write$
    }
    % mid.sentence ではないとき
    { output.state after.block =

        % after.block のとき。 period を付加して write。
	{ is.kanji.entry
            { add.kanji.period.x write$}
 	    { add.period.x " " * write$ }
	  if$
	}
	% after.block じゃないとき。
	{ output.state before.all =
            % before.all のとき。そのまま write。
  	    'write$
            % before.all じゃないとき。 period を付加して write。
	    { is.kanji.entry
  		{ add.kanji.period.x write$ }
 		{ add.period$ " " * write$ }
	      if$
	    }
	  if$
	}
      if$
      
      % mid.sentence 以外のときは mid.sentence に状態を変更。
      mid.sentence 'output.state :=
    }
  if$
  % 直近の filed が period or comma で終わっているなら、その後の comma は除去する。
  last.period.comma #0 =
    { s }
    { s remove.pre.comma.period }
  if$
}

FUNCTION {output.nocomma}
{ duplicate$ empty$
    'pop$
    'output.nonnull.nocomma
  if$
}
%%% output.nonnull.nocomma にチェック機能を付加したもの。エントリーが空なら 
%%% warning が出力される。
FUNCTION {output.check.nocomma}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull.nocomma
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% bbl ファイルへの出力の形式

% \harvarditem[Brezis et~al.]{Brezis, Krugman and
%   Tsiddon}{1993}{brezis93:_leapf_inter_compet}
% Brezis, Elise~S., Paul~R. Krugman, and Daniel Tsiddon  (1993) ``Leapfrogging in
%   International Competition: A Theory of Cycles in National Technological
%   Leadership.'', {\em American Economic Review.}, Vol.~83. No.~5. pp.
%   1211--1219.

% \harvarditem[abbreviated citation]{full citation}{year}{keyword} ...
%
% という形式で出力する。

%%% period を付けて、改行する。
FUNCTION {fin.entry}
{ is.kanji.entry
    { add.kanji.period.x }
    { add.period.x }
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.check}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

INTEGERS {l1 l2 f1 f2 kan.p}
STRINGS {kan.fn kan.ln zzz zz}
FUNCTION {check.kanji.str.sub}
{ 'zzz :=
  zzz #1 "{ll}" format.name$ 'kan.ln := 	% kan.ln	<- 1st author の Last name
  zzz #1 "{ff}" format.name$ 'kan.fn := 	% kan.fn	<- 1st author の first name
  kan.ln #1 #1 substring$ is.kanji.str$ 'l1 :=  % l1 		<- Last name の1文字目
  kan.fn #1 #1 substring$ is.kanji.str$ 'f1 :=  % f1 		<- First name の1文字目
  kan.ln #-1 #1 substring$ is.kanji.str$ 'l2 := % l2 		<- Last name の最後の1文字目
  kan.fn #-1 #1 substring$ is.kanji.str$ 'f2 := % f2 		<- First name の最後の1文字目

  is.kanji.entry #0 =
     % そもそも is.kanji.entry が 0 なら 0 を返す。
     { #0 'kan.p := }
     { l1 #0 = f1 #0 = and l2 #0 = and f2 #0 = and
        % 最初の1文字目、最後の1文字目がどれもアスキーなら 0 
        { #0 'kan.p := }
        { l1 #0 = l2 #0 = and
          f1 #0 = f2 #0 = or and
            % 
            { #0 'kan.p := }
            { #1 'kan.p := }
          if$
        }
      if$
     }
  if$
  kan.p
}

FUNCTION {check.kanji.str}
{ 'zzz :=
  zzz empty$
    { #1 }
    { bst.use.unicode #0 =
       { zzz is.kanji.str$ }
       { zzz check.kanji.str.sub }
      if$
    }
  if$
}

%%% booktitle の整形。
FUNCTION {format.btitle}
{ booktitle empty$
    { "" }
    { is.kanji.entry
	{ bst.btitle.pre.jp booktitle * bst.btitle.post.jp * }
	{ bst.btitle.pre booktitle * bst.btitle.post * }
      if$
    }
  if$
}

%%% journal の整形。
FUNCTION {format.journal}
{ journal empty$
    { "" }
    { is.kanji.entry
	{ bst.journal.pre.jp journal * bst.journal.post.jp * }
 	{ bst.journal.pre journal * bst.journal.post * }
      if$
    }
  if$
}

%%% book の title の整形。
FUNCTION {format.book}
{ title empty$
    { "" }
    { is.kanji.entry
	{ bst.book.pre.jp title * bst.book.post.jp * }
 	{ bst.book.pre title * bst.book.post * }
      if$
    }
  if$
}

%%% 以下、author, editor の処理

% 日本語 author 名のときに alphabet が含まれているかどうか判断する関数。含まれ
% ているなら alphabet.in.author に 1 を代入、含まれていないなら 0 を代入。これ
% は Alphabet + 片仮名の外国人名を処理するためのもの。
FUNCTION {set.alphabet.in.author}
{ name.num "{ff}" format.name$ 't :=
  #0 'alphabet.in.author :=
  "" t =
    % first name がないときは 0。
    { #0 'alphabet.in.author := }
    { 
      % 記号除去
      t purify$ 't :=
      % 一文字目だけ取り出す。
      t #1 text.prefix$ 't :=
      % 日本語か alphabet か？
      t is.kanji.str$
        { #0 'alphabet.in.author :=
        }
        { #1 'alphabet.in.author :=
        }
      if$
    }
  if$
}

%%% 文字の数を判断する関数 (日本語用)。
% 日本語の場合 1 文字が 2 文字と判断されることに注意。
FUNCTION {count.number.of.letters}
{ 'sss :=
   sss text.length$ #2 =
      % 一文字のケースでは "1" を返す。
      { "1" }
      % 一文字以外のケースでは "0" を返す。
      { "0" }
   if$
}

%%% name を処理する関数
FUNCTION {format.names}
{ 's :=
  % nameptr に 1 を代入
  #1 'nameptr :=
  % numnames に author (editor) の数を代入
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  % namesleft が 0 より大なら繰り返し (while)
  { namesleft #0 > }
    % s に日本語含むか？
    { s check.kanji.str
        % 日本語含むケースの処理
        { nameptr 'name.num :=
          s set.alphabet.in.author
          alphabet.in.author #0 =
            % first nameが日本語のケース（日本人名ということ）

            % 注：日本語の author は "姓 名" の順で指定されるが、bst では
            % 順番通りに姓＝first name、名＝last name として扱われる。
            { bst.sei.mei.order #0 =
                { s nameptr "{ff}" format.name$ 'ss :=
                  s nameptr "{ll}" format.name$ 'tt := }
                % 普通と逆順のケース
                { s nameptr "{ll}" format.name$ 'ss :=
                  s nameptr "{ff}" format.name$ 'tt := }
              if$
              ss "" =
                %% 姓のみのケースはそのまま
                { tt 't := }
                %% 姓・名ともにあるケース
                { ss count.number.of.letters "1" =
                  tt count.number.of.letters "1" = or
                    { ss bst.sei.mei.one.jp * tt * 't := }
                    { ss bst.sei.mei.two.jp * tt * 't := }
                  if$
                }
              if$
            }
            % first name が alphabet のケース (つまり、カタカナの外国人名)
            { nameptr #1 =
               % first author のケース (last name - first name の order)
               { bst.author.name #0 =
                 bst.author.name #1 = or
                   % Last name - first name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                 if$
               }
               % first author 以外のケース (first name - last name の order)
               { bst.author.name #0 =
                 bst.author.name #2 = or
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                   % Last name - First name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                 if$
               }
              if$
            }
          if$
        }
        % author に日本語含まないケースの処理
        { nameptr #1 =
           % 一番目の author
	   { bst.author.name #0 =
	     bst.author.name #1 =
	     or
	        { bst.first.name.initial #0 = 
		   { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
		   { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		  if$
		}
	        { bst.first.name.initial #0 = 
	           { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
	           { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		  if$
		}
	     if$
	   }
           % 二番目以降の author
	   { bst.author.name #0 =
	     bst.author.name #2 =
	     or
	        { bst.first.name.initial #0 = 
                   { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
                   { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		 if$
	        }
	        { bst.first.name.initial #0 = 
   	           { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
   	           { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		 if$
	        }
	     if$
	   }
          if$
        }
      if$
      nameptr #1 >
        % 二番目以降の author のケースでの処理
	{ namesleft #1 >
   	    { s check.kanji.str
 		{ bst.and.jp  * t * }
 		{ ", " * t * }
	      if$
	    }
	    { t "others" =
  		{ s check.kanji.str
  		    { bst.and.others.jp * }
                    { bst.and.others * }
 		  if$
 		}
    		{ s check.kanji.str
 		    { bst.and.jp * t * }
		    { numnames #2 =
  			{ bst.and * t * }
  			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%%% name を処理する関数
FUNCTION {format.names.alt}
{ 'sss :=  % 省略されていない名前
  's :=  % 省略された名前
%   "abbreviated (s) = \texttt{" s * "}\\" * write$ 
%   "full (sss) = \texttt{" sss * "}\\" * write$ 
  jecon.debug #0 = not % for debug
     { "abbreviated (s) = \texttt{" s * "}\\" * write$ 
       "full (sss) = \texttt{" sss * "}\\" * write$ }
     'skip$
  if$
  % nameptr に 1 を代入
  #1 'nameptr :=
  % numnames に author (editor) の数を代入
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  % namesleft が 0 より大なら繰り返し (while)
  { namesleft #0 > }
    % s に日本語含むか？
    { sss check.kanji.str
        % 日本語含むケースの処理
        { nameptr 'name.num :=
          s set.alphabet.in.author
          alphabet.in.author #0 =
            % first nameが日本語のケース（日本人名ということ）

            % 注：日本語の author は "姓 名" の順で指定されるが、bst では
            % 順番通りに姓＝first name、名＝last name として扱われる。
            { bst.sei.mei.order #0 =
                { s nameptr "{ff}" format.name$ 'ss :=
                  s nameptr "{ll}" format.name$ 'tt := }
                % 普通と逆順のケース
                { s nameptr "{ll}" format.name$ 'ss :=
                  s nameptr "{ff}" format.name$ 'tt := }
              if$
              ss "" =
                %% 姓のみのケースはそのまま
                { tt 't := }
                %% 姓・名ともにあるケース
                { ss count.number.of.letters "1" =
                  tt count.number.of.letters "1" = or
                    { ss bst.sei.mei.one.jp * tt * 't := }
                    { ss bst.sei.mei.two.jp * tt * 't := }
                  if$
                }
              if$
            }
            % first name が alphabet のケース (つまり、カタカナの外国人名)
            { nameptr #1 =
               % first author のケース (last name - first name の order)
               { bst.author.name #0 =
                 bst.author.name #1 = or
                   % Last name - first name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                 if$
               }
               % first author 以外のケース (first name - last name の order)
               { bst.author.name #0 =
                 bst.author.name #2 = or
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                   % Last name - First name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                 if$
               }
              if$
            }
          if$
        }
        % author に日本語含まないケースの処理
        { nameptr #1 =
           % 一番目の author
	   { bst.author.name #0 =
	     bst.author.name #1 =
	     or
	        { bst.first.name.initial #0 = 
		   { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
		   { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		  if$
		}
	        { bst.first.name.initial #0 = 
	           { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
	           { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		  if$
		}
	     if$
	   }
           % 二番目以降の author
	   { bst.author.name #0 =
	     bst.author.name #2 =
	     or
	        { bst.first.name.initial #0 = 
                   { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
                   { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		 if$
	        }
	        { bst.first.name.initial #0 = 
   	           { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
   	           { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		 if$
	        }
	     if$
	   }
          if$
        }
      if$
      nameptr #1 >
        % 二番目以降の author のケースでの処理
	{ namesleft #1 >
   	    { sss check.kanji.str
 		{ bst.and.jp  * t * }
 		{ ", " * t * }
	      if$
	    }
	    { t "others" =
      	        { s check.kanji.str
  		    { bst.and.others.jp * }
                    { bst.and.others * }
 		  if$
 		}
      	        { sss check.kanji.str
 		    { bst.and.jp * t * }
		    { numnames #2 =
  			{ bst.and * t * }
  			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

% remove successive periods (commas) from author
FUNCTION {remove.ss.period.auth}
{ 's := % こちらは bysame で省略された名前
  'tempc :=  % こちらは元の author (or editor) 名
  s tempc format.names.alt 'tempa :=
  % For debug
  jecon.debug #0 = not % for debug
     { "tempa = \texttt{" tempa * "}\\" * write$ }
     'skip$
  if$

  tempc check.kanji.str
    { bst.author.pre.jp tempa * 'tempa := }
    { bst.author.pre tempa * 'tempa := }
  if$

  tempc check.kanji.str
    { bst.author.post.jp 'tempb := }
    { bst.author.post 'tempb := }
  if$

  tempb #1 #1 substring$ "}" =
    % bst.author.post(.jp) の1文字目が"}"なら、何もしない。
    { tempa tempb * }
    % そうじゃないなら、tempa の最後の一文字と tempb の最初の一文字を比較
    { tempa #-1 #1 substring$ tempb #1 #1 substring$ =
        % 等しければ「tempa + tempb の最初の一文字を除いた文字列」
        { tempa tempb #2 global.max$ substring$ * }
        % 等しくなれば「tempa + tempb」
        { tempa tempb * }
      if$
    }
  if$
}

FUNCTION {insert.bysame}
{ 'zz := 
  bst.use.unicode #0 = 
    { is.kanji.entry.author
       { " \bysamejp{} " }
       { " \bysame{} " }
      if$
    }
    { zz check.kanji.str.sub
       { " \bysamejp{} " }
       { " \bysame{} " }
      if$
    }
  if$
}

% <prev name list> <new name list> compare.names -> <modified name list>
% この関数は bst.use.bysame が 2 のときのみ利用する。
FUNCTION {compare.names.jecon}
% <一個前の author> <現在の author> を引数にとる。
{ 's :=
  'tempa :=

%   "author = " author * "\\" * write$ newline$ % For debug
%   "current author = " s * "\\" * write$ newline$ % For debug
%   "prev.author = " tempa * "\\" * write$ newline$ % For dedug

  tempa num.names$ 'len1.jecon :=  % len1 = the number of previous authors
  s num.names$ 'len2.jecon :=      % len2 = the number of current authors

% len1.jecon := min(len1.jecon,len2.jecon)
% len1 -> min{the number of previous authors, the number of current authors}
  len1.jecon len2.jecon >
    { len2.jecon 'len1.jecon := }
    { }
  if$

% start with an empty string, then while the components are the same
% add "bysame"
  ""
  #1 'i.jecon :=
  % i.jecon > len1.jeon でないなら繰り返し
  { i.jecon len1.jecon > not }
    % current author と previous author が等しいか？
    { tempa i.jecon "{ff }{vv }{ll}{ jj}" format.name$
      s     i.jecon "{ff }{vv }{ll}{ jj}" format.name$ =
        % 等しいとき
        { #1 i.jecon <
            { " and " * }       % bysame で省略する著者の前につく and 
            { }
          if$
          s insert.bysame *
          i.jecon #1 + 'i.jecon := }
        % 等しくないときは len1.jecon にマイナス1を代入 → loop を抜ける。
        { #-1 'len1.jecon := }
      if$
    }
  while$

  jecon.debug #0 = not % for debug
     { "i.jecon = " i.jecon int.to.str$ * "\\" * write$ }
     'skip$
  if$
  % i.jecon には「prev.author と等しい author の数 + 1」が入っている。

% add the rest of the second string
  { i.jecon len2.jecon > not }
    { #1 i.jecon <
        % prev.author と同じ author が一人以上いるとき
        { " and " * }
        { }
      if$
      s i.jecon "{ff }{vv }{ll}{ jj}" format.name$ *
      i.jecon #1 + 'i.jecon :=
    }
  while$
}

%%% author の整形
FUNCTION {format.authors}
{ author empty$
    { "" }
    { bst.use.bysame #2 =
        % 2 のタイプの bysame を利用するとき。
        { prev.author.jecon author compare.names.jecon 's :=

          jecon.debug #0 = not % for debug
            { "prev.author.jecon = \texttt{" prev.author.jecon * "}\\" * write$
              "\noindent s = \texttt{" s * "}\\" * write$
            }
            'skip$
          if$

          % prev.author.jecon に現在の author を代入しておく
          author 'prev.author.jecon :=
        }
        % bysame を利用しないか、1 のタイプの bysame を利用するときは author を
        % s に代入。
        { author 's := }
      if$
      % extra.label.bysame に bysame という値が入っているか？
      extra.label.bysame "bysame" =
        % Yes なら bysame を挿入。
	{ author insert.bysame }
        % No なら ? を返す。
 	{ author s remove.ss.period.auth }
      if$
    }
  if$
}

%%% editor の整形
FUNCTION {format.editors}
{ editor empty$
    { "" }
    { bst.use.bysame #2 =
        { prev.author.jecon editor compare.names.jecon 's :=
          jecon.debug #0 = not
            { "prev.author.jecon = \texttt{" prev.author.jecon * "}\\" * write$ % for debug
              "\noindent s = \texttt{" s * "}\\" * write$ % for debug
            }
            'skip$
          if$
          editor 'prev.author.jecon :=
        }
        { editor 's := }
      if$
      % extra.label.bysame に bysame という値が入っているか？
      extra.label.bysame "bysame" =
        % Yes なら bysame.check に 1 を代入し、bysame を挿入
	{ #1 'bysame.check :=
	  editor insert.bysame }
 	{ editor s remove.ss.period.auth }
      if$
      #1 bysame.check =
        { "" * }
        { editor num.names$ #1 >
 	  { editor check.kanji.str
              { bst.editor.jp * }
	      { bst.editors * }
	    if$
 	  }
  	  { editor check.kanji.str
 	      { bst.editor.jp * }
	      { bst.editor * }
	    if$
 	  }
        if$
        }
      if$
    }
  if$
}

%%% author の整形
FUNCTION {format.authors.alt}
{ author empty$
    { "" }
    % extra.label.bysame に bysame という値が入っているか？
    { extra.label.bysame "bysame" =
        % Yes なら bysame を挿入
	{ author insert.bysame }
 	{ author check.kanji.str
 	    { bst.author.pre.jp author format.names * bst.author.post.jp * }
   	    { bst.author.pre author format.names * bst.author.post * }
	  if$
	}
      if$
    }
  if$
}

%%% editor の整形
FUNCTION {format.editors.alt}
{ editor empty$
    { "" }
    % extra.label.bysame に bysame という値が入っているか？
    { extra.label.bysame "bysame" =
        % Yes なら bysame.check に 1 を代入し、bysame を挿入
	{ #1 'bysame.check :=
	  editor insert.bysame }
	{ editor check.kanji.str
	    { bst.author.pre.jp editor format.names * }
 	    { bst.author.pre editor format.names * bst.author.post * }
	  if$
	}
      if$
      #1 bysame.check =
        { "" * }
        { editor num.names$ #1 >
 	  { editor check.kanji.str
              { bst.editor.jp * }
	      { bst.editors * }
	    if$
 	  }
  	  { editor check.kanji.str
 	      { bst.editor.jp * }
	      { bst.editor * }
	    if$
 	  }
        if$
        }
      if$
    }
  if$
}

%%% format.in.ed.booktitle 用
FUNCTION {format.editors.x}
{ editor empty$
    { "" }
    { editor format.names 
      editor num.names$ #1 >
 	{ editor check.kanji.str
 	    { bst.editor.jp * }
	    { bst.editors * }
	  if$
 	}
 	{ editor check.kanji.str
 	    { bst.editor.jp * }
	    { bst.editor * }
	  if$
 	}
      if$
    }
  if$
}

%%% 「?.」、「?,」のようなケースで、period、comma を除去する関数
FUNCTION {remove.irrelevant.period.comma}
{ 's :=
  s empty$
    { "" }
    % 後ろから3文字とって比較
    { s #-1 #3 substring$ "?,'" =
      s #-1 #3 substring$ "?.'" = or
        % 後ろから3文字を除いたものに "'" を付ける．
        { s #-3 global.max$ substring$ "'" * }
	{ s #-1 #4 substring$ "?,''" =
          s #-1 #4 substring$ "?.''" = or
            { s #-4 global.max$ substring$ "''" * }
	    { s #-1 #2 substring$ "?," =
              s #-1 #2 substring$ "?." = or
                { s #-2 global.max$ substring$ "" * }
                { s #-1 #3 substring$ "?,~" =
                  s #-1 #3 substring$ "?.~" = or
                    { s #-4 global.max$ substring$ "?~" * }
                    { s #-1 #3 substring$ "?, " =
                      s #-1 #3 substring$ "?. " = or
                        { s #-4 global.max$ substring$ "? " * }
                        's
                      if$
                    }
                  if$
                }
	      if$
            }
          if$
        }
      if$
    }
  if$
}

%%% 最後についている「，」、「、」、「．」、「．」を除去する関数 (邦訳書用)
FUNCTION {remove.irrelevant.kutoten}
{ 's :=
  s empty$
    { "" * }
    { s #-1 #1 substring$ "、" =
      s #-1 #1 substring$ "，" = or
      s #-1 #1 substring$ "。" = or
      s #-1 #1 substring$ "．" = or
        { s #-2 global.max$ substring$ "" * }
        { s }
      if$
    }
  if$
}

%%% 最初に「，，」、「、、」、「，、」、「、，」等が付いていたら一個目を除去した
%%% 文字列を返す。
FUNCTION {remove.irrelevant.pre.kutoten}
{ 's :=
  s empty$
    { "" }
    { s #1 #4 substring$ "、、" =
      s #1 #4 substring$ "，，" = or
      s #1 #4 substring$ "，、" = or
      s #1 #4 substring$ "、，" = or
        { s #3 global.max$ substring$ }
        { s }
      if$
    }
  if$
}

%%% title の整形
FUNCTION {format.title.sub}
{ bst.title.lower.case #0 =
     { bst.title.pre title * bst.title.post * }
     { bst.title.pre title "t" change.case$ * bst.title.post * }
  if$
}

FUNCTION {format.title}
{ title empty$
  bst.hide.title #0 = not or
    { "" }
    { is.kanji.entry
      { bst.title.pre.jp title * bst.title.post.jp * }
      { format.title.sub remove.irrelevant.period.comma }
     if$
    }
  if$
}

%%% jtitle の整形
FUNCTION {format.jtitle}
{ jtitle empty$
    { "" }
    { bst.book.pre.jp jtitle * bst.book.post.jp * }
  if$
}

%%% misc の title の処理
FUNCTION {format.misc.title}
{ title empty$
    { "" }
    { is.kanji.entry
      { bst.title.pre.jp title * bst.title.post.jp * }
      { bst.title.pre title * bst.title.post * }
     if$
    }
  if$
}

% - を -- にする関数 (pages 用)
FUNCTION {n.dashify}
{ 't :=
  ""
  %% while$ の条件 (t が empty でないなら実行)
  { t empty$ not }
  %% 処理
  { t #1 #1 substring$ "-" =
      { t #1 #2 substring$ "--" = not
          { bst.dashify.off
              { "-" * }
              { "--" * }
            if$
            t #2 global.max$ substring$ 't :=
          }
          { { t #1 #1 substring$ "-" = }
            { "-" *
              t #2 global.max$ substring$ 't :=
            }
            while$
          }
        if$
      }
      { t #1 #1 substring$ is.kanji.str$
        { t #1 #2 substring$ *
          t #3 global.max$ substring$ 't :=
        }
         { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
        if$
      }
    if$
  }
  while$
}

%%% 与えられた数を漢数字に変換: 0->〇, 1->一, 2->二,..., 9->九 という対応関係。
%%% さらに、"-" は縦棒に変換する。
FUNCTION {convert.num.kanji}
{ 's :=
  s "1" =
    { "一" }
    { s "2" =
        { "二" }
        { s "3" =
            { "三" }
            { s "4" =
                { "四" }
                { s "5" =
                    { "五" }
                    { s "6" =
                        { "六" }
                        { s "7" =
                            { "七" }
                            { s "8" =
                                { "八" }
                                { s "9" =
                                    { "九" }
                                    { s "0" =
                                        { "〇" }
                                        { s "-" =
                                           { "\tatebo{}" }
                                           { s }
                                          if$
                                        }
                                      if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% 半角の alphabet を全角の alphabet に変更する関数 (a-j までのみ)。
FUNCTION {convert.alphabet.zenkaku}
{ 's :=
  s "a" =
    { "ａ" }
    { s "b" =
        { "ｂ" }
        { s "c" =
            { "ｃ" }
            { s "d" =
                { "ｄ" }
                { s "e" =
                    { "ｅ" }
                    { s "f" =
                        { "ｆ" }
                        { s "g" =
                            { "ｇ" }
                            { s "h" =
                                { "ｈ" }
                                { s "i" =
                                    { "ｉ" }
                                    { s "j" =
                                        { "ｊ" }
                                        { s }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% year を漢数字に変換
FUNCTION{convert.year.kanji}
{ 't :=
  %% bst.kansuji.jp が非ゼロでかつ，t が漢字じゃないのなら，漢字に変換
  bst.kansuji.jp #0 = not t is.kanji.str$ not and 
     { "" 'tt :=
       { t empty$ not }
       { tt t #1 #1 substring$ convert.num.kanji convert.alphabet.zenkaku * 'tt :=
         t #2 global.max$ substring$ 't := }
       while$
     }
     { t 'tt := }
  if$
 tt
}

%%% bst.kansuji.jp が非ゼロのとき、数字を漢数字に変換する関数。
FUNCTION{convert.num}
{ 't :=
  bst.kansuji.jp #0 = t is.kanji.str$ or
     { t 'tt := }
     { "" 'tt :=
       { t empty$ not }
       { t #1 #1 substring$ convert.num.kanji 'ss :=
         tt ss * 'tt :=
         t #2 global.max$ substring$ 't :=
         }
       while$
     }
  if$
 tt
}

%% 変数定義
STRINGS { da db dc dd }
%% pages の "--" を "-" に変換する．
FUNCTION {remove.duplicate.dash}
{ 'da :=
  "" 'db :=
  "" 'dc :=
  "" 'dd :=
  { da empty$ not }
  { da #1 #1 substring$ 'db :=
    db "-" = dc "-" = and
       'skip$
       { dd db * 'dd := }
    if$
    db 'dc :=
    da #2 global.max$ substring$ 'da :=
  }
  while$
  dd
}

%%% bst.kansuji.jp が非ゼロのとき、pages を漢数字に変換する関数。
FUNCTION{convert.num.pages}
{ 't :=
  bst.kansuji.jp #0 = t is.kanji.str$ or
     { t 'tt := }
     { "" 'tt :=
       t remove.duplicate.dash 't :=
       { t empty$ not }
       { t #1 #1 substring$ convert.num.kanji 'ss :=
         tt ss * 'tt :=
         t #2 global.max$ substring$ 't :=
         }
       while$
     }
  if$
 tt
}

%%% year の処理
FUNCTION {format.year}
{ year empty$
    { "there's no year in " cite$ * warning$
      "" }
    { is.kanji.entry
        { bst.kansuji.jp #0 =
           { bst.year.pre.jp year * extra.label * bst.year.post.jp * }
           { bst.year.pre.jp year convert.year.kanji *
             extra.label convert.alphabet.zenkaku * bst.year.post.jp * }
          if$
        }
        { bst.year.pre year * extra.label * bst.year.post * }
      if$
    }
  if$
}

%%% book の page の処理
FUNCTION {format.book.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { bst.page.pre.jp pages convert.num.pages * bst.page.post.jp * }
        { bst.pages.pre pages * bst.pages.post * }
      if$
    }
  if$
}

%%% 2文字以下なら前に tie を付ける．
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

%%% book の volume の整形
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { is.kanji.entry
	{ bst.volume.pre.jp volume convert.num * bst.volume.post.jp * }
        { bst.volume.pre volume * bst.volume.post * }
      if$
      series empty$
	'skip$
	%% series もあるとき
	{ is.kanji.entry
	    { bst.series.pre.jp * series convert.num * bst.series.post.jp * }
	    { " of " * series * bst.series.post * }
	  if$
	}
      if$
    }
  if$
}

%%% series の出力
FUNCTION {output.series}
{ series empty$
    { "" }
    { is.kanji.entry
        { bst.series.pre.jp series convert.num * bst.series.post.jp * }
        { bst.series.pre series * bst.series.post * }
      if$
    }
 if$
}

%%% number と series を出力
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
      bst.hide.number #0 = not or
        % number is empty
   	{ series empty$
	    { "" }
	    % series is not empty.
	    { output.series }
	  if$
	}
        % number is not empty$
	{ series empty$
	    { is.kanji.entry
	        { bst.number.pre.jp number convert.num * bst.number.post.jp * }
		{ bst.number.pre number * bst.number.post * }
	      if$
	    }
	    % series is not empty.  日本語と英語で順序逆にする。
	    { is.kanji.entry
 	        { bst.series.pre.jp series convert.num * bst.series.post.jp *
		  bst.number.pre.jp * number convert.num * bst.number.post.jp * }
		{ bst.in bst.series.pre * series * bst.series.post *
		  bst.number.pre * number * bst.number.post * }
	      if$
	    }
	  if$
	}
      if$
    }
    { "" }
  if$
}

%%% 数字かどうか判断する
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	edition 処理用のプログラム

% 英語の edition は全て 1st, 2nd, 3rd, 4th etc. に変換する。
FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bst.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bst.st * }
         { duplicate$ "2" =
             { pop$ bst.nd * }
             { "3" =
                 { bst.rd * }
                 { bst.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

% edition entry の first, second 等を 1st, 2nd に変換する (from jfm.bst)。
FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bst.first }
    { s "second" = s "2" = or
        { bst.second }
        { s "third" = s "3" = or
            { bst.third }
            { s "fourth" = s "4" = or
                { bst.fourth }
                { s "fifth" = s "5" = or
                    { bst.fifth }
                    { s #1 #1 substring$ is.num
                        { s eng.ord }
                        { edition }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

% 日本語文献の場合には英語の月を数字に変換する。
FUNCTION {convert.month}
{ 't := 
  t "January" =
    { "1" }
    { t "February" =
        { "2" }
        { t "March" =
            { "3" }
            { t "April" =
                { "4" }
                { t "May" =
                    { "5" }
                    { t "June" =
                        { "6" }
                        { t "July" =
                            { "7" }
                            { t "August" =
                                { "8" }
                                { t "September" =
                                    { "9" }
                                    { t "October" =
                                        { "10" }
                                        { t "November" =
                                            { "11" }
                                            { t "December" =
                                                { "12" }
                                                't
                                            if$
                                            }
                                        if$
                                        }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% edition の整形
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { is.kanji.entry
	{ bst.edition.pre.jp edition convert.num * bst.edition.post.jp * }
        { output.state mid.sentence =
            { bst.edition.pre convert.edition "l" change.case$ * bst.edition.post * }
            { bst.edition.pre convert.edition "t" change.case$ * bst.edition.post * }
          if$
        }
      if$
    }
  if$
}

%%% month の整形。
FUNCTION {format.month}
{ month empty$
  % bst.hide.month が非ゼロなら month は出力せず
  bst.hide.month #0 = not or
    { "" }
    { is.kanji.entry
        { bst.month.pre.jp month convert.month convert.num * bst.month.post.jp * }
        { bst.month.pre month * bst.month.post * }
      if$
    }
  if$
}

%%% year と month を一緒に処理するためのもの。
FUNCTION {format.date}
{ is.kanji.entry
   %% 日本語文献 -> 年 - 月
   { format.year format.month * }
   %% 英語 -> 月 - 年
   { format.month format.year * }
  if$
}

%%% 複数のページが指定されているかチェック (1-100等のように)．
FUNCTION { multi.page.check }
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

%%% pages の整形。
FUNCTION {format.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { pages multi.page.check
          { bst.page.pre.jp pages n.dashify convert.num.pages * bst.page.post.jp * }
          { bst.page.pre.jp pages convert.num.pages * bst.page.post.jp * }
         if$
        }
        { pages multi.page.check
 	  { bst.pages.pre pages n.dashify tie.or.space.connect * bst.pages.post }
	  { bst.page.pre pages tie.or.space.connect * bst.page.post }
         if$
        }
       if$
   }
 if$
}

%%% number を整形
FUNCTION {format.number}
{ number empty$
  % bst.hide.number が非ゼロなら number は出力せず
  bst.hide.number #0 = not or
    { "" }
    { is.kanji.entry
        { bst.number.pre.jp number convert.num * bst.number.post.jp * }
	{ bst.number.pre number * bst.number.post * }
      if$
    }
  if$
}

%%% volume を整形
FUNCTION {format.volume}
{ volume empty$
    'skip$
    { is.kanji.entry
        { bst.volume.pre.jp volume convert.num * bst.volume.post.jp * }
	{ bst.volume.pre volume * bst.volume.post * }
      if$
      bst.year.position #3 =
        { format.year * }
        'skip$
      if$
    }
  if$
}

%%% number、page を出力
FUNCTION {format.number.pages}
{ format.number format.pages * }

%%% volume、page を出力
FUNCTION {format.volume.pages}
{ format.volume format.pages * }

%%% volume、number、page を出力
FUNCTION {format.volume.number.pages}
{ format.volume format.number * format.pages * }

% volume, number, page を一緒に処理する関数。
FUNCTION {format.vol.num.pages}
{ volume empty$
    %% volume is empty.
    { number empty$
        %% number is empty.
        { pages empty$
	    % この場合は warning を出す。
            { "there is no volume, number, and pages in " cite$ * warning$ "" }	
	    { "" format.pages * }
         if$
        }
        %% number is not empty.
	% この場合は warning を出す。
	{ "there's a number but no volume in " cite$ * warning$
	  format.number.pages }
     if$
    }
    %% volume is not empty.
    { number empty$
        %% number is empty.
	{ format.volume.pages }
        %% number is not empty.
	{ format.volume.number.pages }
     if$
    }
  if$
}

%%% chapter の整形。
FUNCTION {format.chapter}
{ chapter empty$
    { "" }
    { type empty$
        { is.kanji.entry
            { bst.chapter.pre.jp chapter convert.num * bst.chapter.post.jp * }
            { bst.chapter.pre chapter tie.or.space.connect * bst.chapter.post }
          if$
        }
        { is.kanji.entry
            { bst.touten.jp * type " " * chapter convert.num * }
            { ", " * type " " * chapter * }
          if$
        }
      if$
    }
  if$
}

%%% chapter, pages を一緒に処理する関数
FUNCTION {format.chapter.pages}
{ chapter empty$
    { pages empty$
        { "" }
	{ "" format.pages * }
      if$
    }
    { pages empty$
        { "" format.chapter * }
        { "" format.chapter * format.pages * }
      if$
    }
  if$
}

%%% editor and booktitle の整形。
FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
 	{ is.kanji.entry
    	    { format.btitle remove.pre.comma.period }
   	    { bst.in format.btitle * }
 	  if$
 	}
 	{ is.kanji.entry
  	    { format.editors.x "" * format.btitle * }
    	    { bst.in format.editors.x * " " * format.btitle * }
 	  if$
 	}
      if$
    }
  if$
}

%%% translator & kanyaku の整形。
FUNCTION {format.translator}
{ kanyaku empty$
   { translator empty$
      { "" }
      { bst.translator.pre.jp translator format.names * bst.translator.post.jp * }
    if$
   }
   { translator empty$
      { bst.kanyaku.pre.jp kanyaku format.names * bst.kanyaku.post.jp * }
      { bst.kanyaku.pre.jp kanyaku format.names * bst.kanyaku.post.jp * 
        bst.translator.pre.jp * translator format.names * bst.translator.post.jp * }
     if$
   }
  if$
}

%%% howpublished の整形。
FUNCTION {format.howpublished}
{ howpublished empty$
    { "" }
    { is.kanji.entry
        { bst.howpublished.pre.jp howpublished * bst.howpublished.post.jp * }
        { bst.howpublished.pre howpublished * bst.howpublished.post * }
      if$
    }
  if$
}

%%% address の整形。
FUNCTION {format.address}
{ address empty$
    { "" }
    { is.kanji.entry
        { bst.address.pre.jp address * bst.address.post.jp * }
        { bst.address.pre address * bst.address.post * }
      if$
    }
  if$
}

%%% publisher の整形。
FUNCTION {format.publisher}
{ publisher empty$
    { "" }
    { is.kanji.entry 
        { bst.publisher.pre.jp publisher * bst.publisher.post.jp * }
	{ bst.publisher.pre publisher * bst.publisher.post * }
      if$
    }
  if$
}

%%% organization の整形。
FUNCTION {format.organization}
{ organization empty$
    { "" }
    { is.kanji.entry
        { bst.organization.pre.jp organization * bst.organization.post.jp * }
	{ bst.organization.pre organization * bst.organization.post * }
      if$
    }
  if$
}

%% publisher と address を出力する関数
FUNCTION {output.publisher.address}
{ address empty$
    { format.publisher "publisher" output.check.nocomma }
    % 日本語、英語で publisher と address の順序が逆
    { is.kanji.entry
	{ format.publisher "publisher" output.check.nocomma
	  format.address output.nocomma }
	{ format.address output.nocomma
	  format.publisher "publisher" output.check.nocomma }
      if$
    }
  if$
}

%% address, organization, publisher を出力する関数
FUNCTION {output.address.organization.publisher}
{ address empty$
    %% address is empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    'skip$
	    { format.publisher "publisher" output.check.nocomma }
	  if$
        }
        %% organization is not empty
        { publisher empty$
	    { format.organization "organization" output.check.nocomma }
	    { format.organization "organization" output.check.nocomma
	      format.publisher "publisher" output.check.nocomma }
	  if$
        }
     if$
    }
    %% address is not empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    %% publisher is empty
	    { format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
        %% organization is not empty
        { publisher empty$
	    %% publisher is empty
	    { format.organization "organization" output.check.nocomma
	      format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.organization "organization" output.check.nocomma
		  format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.organization "organization" output.check.nocomma
		  format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
     if$
    }
  if$
}

%%% misc 用
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$ " " type * }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    { " " type * }
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

%%% phdthesis の整形
FUNCTION {format.phd}
{ is.kanji.entry
    { bst.phdthesis.jp }
    { bst.phdthesis }
   if$
}

%%% mastersthesis の整形
FUNCTION {format.mthesis}
{ is.kanji.entry
    { bst.mthesis.jp }
    { bst.mthesis }
   if$
}

%%% school の整形
FUNCTION {format.school}
{ school empty$
    { "" }
    { is.kanji.entry
        { bst.school.pre.jp school * bst.school.post.jp * }
        { bst.school.pre school * bst.school.post * }
      if$
    }
  if$
}

%%% institution の整形
FUNCTION {format.institution}
{ institution empty$
    { "" }
    { is.kanji.entry
        { bst.institution.pre.jp institution * bst.institution.post.jp * }
	{ bst.institution.pre institution * bst.institution.post * }
      if$
    }
  if$
}  

%%% hoyakusho の整形
FUNCTION {format.hoyakusho}
{ jauthor empty$
  jkanyaku empty$
  jtitle empty$
  jpublisher empty$
  jyear empty$
  and and and and
    { "" }
    {
      is.kanji.entry
        { bst.touten.jp }
        { ", " }
      if$
      bst.hoyakusho.pre.jp * 
      jauthor empty$
        { jkanyaku empty$
            { "" * }
            { jkanyaku format.names * "監訳" * }
          if$
        }
        { jauthor format.names * "訳" *
          jkanyaku empty$
            { "" * }
            { bst.touten.jp * jkanyaku format.names * "監訳" * }
          if$
        }
      if$
      jtitle empty$
        { "" * }
        { bst.touten.jp format.jtitle * bst.touten.jp * remove.irrelevant.pre.kutoten * }
      if$
      jpublisher empty$
        { "" * }
        { jpublisher * bst.touten.jp * }
      if$
      jyear empty$
        { "" * }
        { "" * jyear convert.year.kanji * "年" * }
      if$
      remove.irrelevant.kutoten bst.hoyakusho.post.jp *
    }
 if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    { type$ "online" = bst.show.url or
        { is.kanji.entry
            { bst.url.pre.jp url * bst.url.post.jp *
                access empty$
                    { "" * }
                    { bst.access.pre.jp * access * bst.access.post.jp * }
                if$
            }
            { bst.url.pre url * bst.url.post *
                access empty$
                    { "" * }
                    { bst.access.pre * access * bst.access.post * }
                if$
            }
          if$
        }
        { "" }
      if$
    }
  if$
}

FUNCTION {format.doi}
{ doi empty$ bst.show.doi not or
    { "" }
    { bst.doi.pre doi * bst.doi.post * }
  if$
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { is.kanji.entry
        { bst.note.pre.jp note * bst.note.post.jp * }
        { bst.note.pre note * bst.note.post * }
      if$
    }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 \havarditem の出力．

FUNCTION {output.number.index}
{
  bst.use.number.index #0 =
     'skip$
     { index #1 + 'index :=
       "" 'preone :=
       "" 'preten :=
       bst.number.index.digit "1" =
         'skip$
         { bst.number.index.digit "2" =
           { "\hskip0.5em" 'preone := }
           { bst.number.index.digit "3" =
              { "\hskip1em" 'preone :=
                "\hskip0.5em" 'preten := }
              'skip$
             if$
           }
         if$
         }
       if$  
     }
  if$
  newline$
  ""
  % 以下も、number index を付ける場合の処理
  bst.use.number.index #0 =
     'skip$
     { index #10 <
         % number index の桁に応じて前に空白を入れる。
         { preone }
	 { index #100 <
	     { preten }
             { "" }
	   if$
	 }
       if$
       bst.number.index.pre * index int.to.str$ * bst.number.index.post * write$
     }
 if$
}

FUNCTION {output.bibitem}
{ bst.harvarditem.off
    { before.all 'output.state :=
      "" }
    { newline$
      "\harvarditem[" write$
      alabel write$			% alabel が abbreviated citation
      "]{" write$
      flabel write$			% flabel が full citation
      "}{" write$
      is.kanji.entry
         { cyear convert.year.kanji write$ }	% cyear が year
         { cyear write$ }
      if$
      % cyear が year
      "}{" write$
      cite$ write$			% cite$ で keyword がプッシュされる。
      "}" write$
      before.all 'output.state :=
    
      % 以下は、number index を付ける場合の処理
      output.number.index
    }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 エントリーのタイプ別の処理

% FUNCTION {article} は article タイプのエントリーを処理するための関数。

FUNCTION {test}
{
  output.bibitem
  author output.nocomma
  year output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 article の処理
FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.journal "journal" output.check.nocomma
  bst.year.position #2 =
    { format.date output.nocomma }
    'skip$
  if$
  format.vol.num.pages output.nocomma

  bst.year.position #1 =
    { format.date output.nocomma }
    { format.month output.nocomma }
  if$

  format.url output.nocomma
  format.doi output.nocomma
  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 book の処理
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      "author and editor" editor either.or.check 
    }
  if$
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.book "title" output.check.nocomma

  format.translator output.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  output.publisher.address

  format.edition output.nocomma
  format.book.pages output.nocomma

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.hoyakusho output.nocomma
  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 booklet の処理
FUNCTION {booklet}
{ output.bibitem
  format.authors output.nocomma
  format.year output.nocomma
  format.misc.title "title" output.check.nocomma
  format.howpublished output.nocomma
  format.address output.nocomma

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inbook の処理
FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      "author and editor" editor either.or.check
    }
  if$
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.book "title" output.check.nocomma
  format.edition output.nocomma

  format.bvolume output.nocomma
  format.chapter.pages "chapter and pages" output.check.nocomma
  format.number.series output.nocomma
  output.publisher.address

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	incollection の処理
FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.in.ed.booktitle "booktitle" output.check.nocomma
  format.bvolume output.nocomma
  output.address.organization.publisher
  format.edition output.nocomma
  format.chapter.pages output.nocomma

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inproceedings の処理
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.in.ed.booktitle "booktitle" output.check.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  format.pages output.nocomma
  output.address.organization.publisher

  bst.year.position #0 = not
    { format.date output.nocomma }
    { format.month output.nocomma }
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	conference の処理
FUNCTION {conference}
{ inproceedings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	manual の処理
FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull.nocomma
	  address output.nocomma
	}
      if$
    }
    { format.authors output.nonnull.nocomma }
  if$
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.book "title" output.check.nocomma
  author empty$
    { organization empty$
	{ format.address new.block.check
	  format.address output.nocomma
	}
	'skip$
      if$
    }
    { output.address.organization.publisher }
  if$
  format.edition output.nocomma

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	mastersthesis の処理
FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.mthesis format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  format.address output.nocomma

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	misc の処理
FUNCTION {misc}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.misc.title output.nocomma
  format.howpublished output.nocomma

  remove.irrelevant.kutoten

  bst.year.position #0 = not
    { format.date output.nocomma }
    { format.month output.nocomma }
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
  empty.misc.check
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	online の処理
FUNCTION {online}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.misc.title output.nocomma
  format.howpublished output.nocomma

  remove.irrelevant.kutoten

  bst.year.position #0 = not
    { format.date output.nocomma }
    { format.month output.nocomma }
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
  empty.misc.check
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	phdthesis の処理
FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.phd
  format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  address empty$
    'skip$
    { format.address output.nocomma }
  if$

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	proceedings の処理
FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output.nocomma }
    { format.editors output.nonnull.nocomma }
  if$
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.btitle remove.pre.comma.period "title" output.check.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  output.address.organization.publisher

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	techreport の処理
FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.tr.number output.nonnull.nocomma
  format.institution "institution" output.check.nocomma
  format.address output.nocomma
  format.chapter.pages output.nocomma %%% added

  bst.year.position #0 = not
    { format.year "year" output.check.nocomma }
    'skip$
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	unpublished の処理
FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.position #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  bst.year.position #0 = not
    { format.date remove.pre.comma.period output.nocomma }
    { month empty$
        'skip$
        { format.month remove.pre.comma.period output.nocomma }
      if$
    }
  if$

  format.url output.nocomma
  format.doi output.nocomma

  format.note output.nocomma
  fin.entry
}

FUNCTION {default.type}
{ misc }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	月の略称定義

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

%%% エントリを読み込む
READ

%%% エントリーが日本語文献か判断するための関数
FUNCTION {set.is.kanji.entry.author}
{
  author    field.or.null is.kanji.str$
  editor    field.or.null is.kanji.str$ or
  'is.kanji.entry.author :=
}

%%% エントリーが日本語文献か判断するための関数 (yomi は除く)
FUNCTION {set.is.kanji.entry.auto}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}

%%% エントリーが日本語文献か判断するための関数。language フィールドに「ja」が入っ
%%% ていれば日本語文献。
FUNCTION {set.is.kanji.entry.manual}
{ language empty$
    { #0 'is.kanji.entry := }
    { language "ja" =
       { #1 'is.kanji.entry := }
       { #0 'is.kanji.entry := }
      if$
    }
  if$
}

FUNCTION {set.is.kanji.entry}
{ set.is.kanji.entry.auto
  bst.use.unicode #0 =
    'skip$
    { set.is.kanji.entry.manual }
  if$
}

%%% エントリーが日本語文献か判断するための関数 (yomi も含めて)
FUNCTION {set.is.kanji.entry.two}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  yomi      field.or.null is.kanji.str$ or
  'is.kanji.entry.two :=
}

%%% 全てのエントリーに対し実行
ITERATE {set.is.kanji.entry.author}
ITERATE {set.is.kanji.entry}
ITERATE {set.is.kanji.entry.two}

%%% 引用順を保持する変数
INTEGERS { order.num }
FUNCTION {initialize.order.num}
{
  #1 'order.num :=
}
%%% 初期値に1を設定
EXECUTE {initialize.order.num}

%%% 変数 order.cited には引用順の数値が入る．
FUNCTION {set.order.cited}
{
  order.num 'order.cited :=
  #1 order.num + 'order.num :=
}
%%% 全てのエントリーに対し実行
ITERATE {set.order.cited}
  
%%% 記号を除去し、小文字に変換
FUNCTION {sortify}
{ purify$ "l" change.case$ }

%%% 先頭何文字かを除去する。
% s の最初から len 文字を除去
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%%% ソート用に名前を加工
FUNCTION {sort.format.names}
{ 's :=
  yomi empty$
     'skip$
     { yomi 's := }
  if$
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { ", " * }
	'skip$
      if$
      s check.kanji.str
         { bst.sei.mei.order #0 =
             { s nameptr "{ff }{ll}" format.name$ 't := }
             { s nameptr "{ll }{ff}" format.name$ 't := }
           if$
         }
         { s nameptr "{ll}{ ff}{ jj}" format.name$ 't := }
      if$
      nameptr #1 =
         { t " 0 " * 't := }
         'skip$
      if$
      nameptr numnames = t "others" = and
 	{ s check.kanji.str
  		{ bst.and.others.jp * }
 		{ bst.and.others * }
	  if$
 	}
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%%% ソート用に名前を加工
FUNCTION {sort.format.names.abb}
{ 's :=
  yomi empty$
     'skip$
     { yomi 's := }
  if$
  s num.names$ 'numnames :=
  numnames bst.and.others.num <
     { s sort.format.names }
     { s check.kanji.str
         % author 名が日本語を含むケース
         { bst.sei.mei.order #0 =
             { s #1 "{ff }{ll}" format.name$ " et al. " * }
             { s #1 "{ll }{ff}" format.name$ " et al. " * }
           if$
         }
         { s #1 "{ll}{ ff}{ jj}" format.name$ " et al. " * }
       if$
     }
  if$
}

%%% Full author name の label の作成
FUNCTION {format.lab.names.full}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
      { s check.kanji.str
          % author 名に日本語含むケース
          { nameptr 'name.num :=
            s set.alphabet.in.author
            alphabet.in.author #0 =
              % first name も日本語（日本人名のケース）
              { s nameptr "{ll}" format.name$ 't :=
                t "others" =
                  'skip$
                  { bst.sei.mei.order #0 =
                     { s nameptr "{ff}" format.name$ 't := }
                     { s nameptr "{ll}" format.name$ 't := }
                   if$
                  }
                if$
                t empty$
                  { s #1 "{ll}" format.name$ 't := }
                  'skip$
                if$
              }
              % first name が alphabet のケース（外国人名のケース）
              { s nameptr "{ll}" format.name$ 't := }
            if$
	    nameptr #1 >
              { namesleft #1 >
                  { bst.cite.and.jp * t * }
                  { t "others" =
                      { bst.and.others.jp * }
                      { bst.cite.and.jp * t * }
                    if$
                  }
                if$
              }
              't
            if$
            nameptr #1 + 'nameptr :=
            namesleft #1 - 'namesleft :=
          }

          % author 名に日本語含まないケース
          { s nameptr "{vv~}{ll}" format.name$ 't :=
              nameptr #1 >
                { namesleft #1 >
                    { ", " * t * }
                    { t "others" =
                        { bst.and.others * }
                        { numnames #2 > 
                           { bst.cite.ands * t * }
                           { bst.cite.and * t * }
                          if$
                        }
                      if$
                    }
                  if$
                }
                't
              if$
              nameptr #1 + 'nameptr :=
              namesleft #1 - 'namesleft :=
          }
        if$
      }
    while$
    numnames #1 > #1 #2 = and {", eds" *} {} if$
    numnames #1 = #1 #2 = and {", ed" *} {} if$
}

%%% author name の label の作成 (abbreviated name).
FUNCTION {format.lab.names.abb}
{ 's :=
   s num.names$ 'numnames :=
   numnames bst.and.others.num <
     % author 数が bst.and.others.num より小さいなら full で表示。
     { s format.lab.names.full }
     % author 数が bst.and.others.num 以上なら 1st author のみ表示。あとは略。
     { s check.kanji.str
         % author 名が日本語を含むケース
         { #1 'name.num :=
           s set.alphabet.in.author
           alphabet.in.author #0 =
            % first name も日本語のケース（日本人名のケース）
            
            % 注：日本語の author は "姓 名" の順で指定されるが、bst では
            % 順番通りに姓＝first name、名＝last name として扱われる。
            { bst.sei.mei.order #0 =
                { s #1 "{ff}" format.name$ 't := }
                { s #1 "{ll}" format.name$ 't := }
              if$
              t empty$
                { s #1 "{ll}" format.name$ 't := }
                'skip$
              if$
              t bst.and.others.jp * }

            % first name が alphabet のケース（外国人名のケース）
            { s #1 "{ll}" format.name$ 't := 
              t bst.and.others.jp * }
          if$
         }
         % author名がアルファベットのケース
         { s #1 "{ll}" format.name$ bst.and.others * }
       if$
     }
   if$
}

%%% これは abbreviated author 名
FUNCTION {author.key.label.abb}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.abb }
  if$
}

%%% これは full author 名
FUNCTION {author.key.label.full}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

%%% これは sort 用の author 名
FUNCTION {author.key.label.sort}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author sort.format.names }
  if$
}

%%% これは sort 用の名前を作成
FUNCTION {author.editor.key.label.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
        { yomi empty$
           { editor sort.format.names }
           { bst.mixed.order #0 = 
              { editor sort.format.names }
              { yomi sort.format.names }
    	if$
          }
          if$
        }
      if$
    }
    { yomi empty$
       { author sort.format.names }
       { bst.mixed.order #0 = 
          { author sort.format.names }
          { yomi sort.format.names }
	if$
      }
      if$
    }
  if$
}

%%% これは abbreviated author 名を作成する関数
FUNCTION {author.editor.key.label.abb}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
 	{ editor format.lab.names.abb }
      if$
    }
    { author format.lab.names.abb }
  if$
}

%%% これは full author 名
FUNCTION {author.editor.key.label.full}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names.full }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label.full}
{ author empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label.abb}
{ author empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.abb }
  if$
}

FUNCTION {editor.key.organization.label.full}
{ editor empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names.full }
  if$
}

FUNCTION {editor.key.organization.label.abb}
{ editor empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names.abb }
  if$
}

%%% 与えられた数を変換: 0->9, 1->8, 2->7,..., 9->0 という対応関係。
FUNCTION {reverse.num}
{ 's :=
  s "1" =
    { "8" 'year.num := }
    { s "2" =
        { "7" 'year.num := }
        { s "3" =
            { "6" 'year.num := }
            { s "4" =
                { "5" 'year.num := }
                { s "5" =
                    { "4" 'year.num := }
                    { s "6" =
                        { "3" 'year.num := }
                        { s "7" =
                            { "2" 'year.num := }
                            { s "8" =
                                { "1" 'year.num := }
                                { s "9" =
                                    { "0" 'year.num := }
                                    { s "0" =
                                        { "9" 'year.num := }
                                        { "9" 'year.num := }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
  year.num
}

%%% year を変換 (大きい数字 -> 小さい数字)
FUNCTION {convert.year}
{ 't := 
  bst.reverse.year #0 =
    % 普通の year の並び順
    { t 'tt := }
    % year の並び順をひっくり返すケース (新しいほど先に表示するケース)。
    { t #1 #1 substring$ reverse.num 
      t #2 #1 substring$ reverse.num *
      t #3 #1 substring$ reverse.num *
      t #4 #1 substring$ reverse.num * 'tt := }
  if$
  tt
}

%%% cyear を計算． cyear は引用部分で表示される年を保持する変数．reference 部
%%% 分の表示には関係ない．また同時にここで sort.label を計算している．
%%% sort.label は文献の sort のために利用される author (editor) 名を保持する変
%%% 数．yomi field がある場合には結局 sort.label の中身は使われない．
FUNCTION {calc.cyear}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.sort
    { type$ "proceedings" =
	'editor.key.organization.label.full
	{ type$ "manual" =
	    'author.key.organization.label.full
	    'author.key.label.sort
	  if$
	}
      if$
    }
  if$
  duplicate$
  year 'cyear :=
  " " year convert.year * field.or.null *
  sortify 'sort.label :=
  % For debug
  jecon.debug #0 = not
    { "sort.label = ``\texttt{" write$
      sort.label write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

FUNCTION {calc.sort.label.abb}
{ yomi empty$
    { author empty$
        { editor empty$
           { "" }
           { editor 's := }
          if$
        }
        { author 's := }
      if$
    }
    { yomi 's := }
  if$
  s sort.format.names.abb 't := 
  t sortify " " * year convert.year * 'sort.label.abb :=
  jecon.debug #0 = not
    { "sort.label.abb = ``\texttt{" write$
      sort.label.abb write$
      "}''\\" write$
      newline$
    }
    'skip$
  if$
}

%%% flabel を計算．flabel は引用部分の著者名を保持する変数．reference 部分には
%%% 関係ない．
FUNCTION {calc.flabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.full
    { type$ "proceedings" =
	'editor.key.organization.label.full
	{ type$ "manual" =
	    'author.key.organization.label.full
	    'author.key.label.full
	  if$
	}
      if$
    }
  if$
  'flabel :=
  % For debug
  jecon.debug #0 = not
    { "flabel = ``\texttt{" write$
      flabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% alabel を計算．alabel は引用部分の著者名 (短縮形表示) を保持する変数．
%%% reference 部分は関係ない．
FUNCTION {calc.alabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.abb
    { type$ "proceedings" =
	'editor.key.organization.label.abb
	{ type$ "manual" =
	    'author.key.organization.label.abb
	    'author.key.label.abb
	  if$
	}
      if$
    }
  if$
  'alabel :=
  % For debug
  jecon.debug #0 = not
    { "alabel = ``\texttt{" write$
      alabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% ソート用に title を加工
FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%%% 数字が一文字 (つまり, 1,...,9等) ならその前に 00 を，数字が二文字
%%% (10,...,99) なら 0 を付ける．10, 11, 12 の指定が 2, 3, 4,... よりも優先さ
%%% れるのを防ぐため。
FUNCTION {add.zero.to.number}
{ 's :=
    s text.length$ #1 =
      { "00" s * }
      { s text.length$ #2 =
          { "0" s * }
          { s }
        if$
      }
   if$
}

%% entry type に数値を割当てる．数値が小さいほうが bst.sort.entry.type が非ゼ
%% ロのときに先に列挙されることになる．
FUNCTION {bst.sort.entry.type.order}
{ 'item.type :=
  item.type "article" =
     { "01" }
     { item.type "book" =
         { "02" }
         { item.type "booklet" =
             { "03" }
             { item.type "comment" =
                 { "04" }
                 { item.type "conference" =
                     { "05" }
                     { item.type "inbook" =
                         { "06" }
                         { item.type "incollection" =
                             { "07" }
                             { item.type "inproceedings" =
                                 { "08" }
                                 { item.type "manual" =
                                     { "09" }
                                     { item.type "masterthesis" =
                                         { "10" }
                                         { item.type "misc" =
                                             { "11" }
                                             { item.type "phdthesis" =
                                                 { "12" }
                                                 { item.type "proceedings" =
                                                     { "13" }
                                                     { item.type "techreport" =
                                                         { "14" }
                                                         { item.type "unpublished" =
                                                             { "15" }
                                                             { "16" }
                                                           if$
                                                         }
                                                       if$
                                                     }
                                                   if$
                                                 }
                                               if$
                                             }
                                           if$
                                         }
                                       if$
                                     }
                                 if$
                                 }
                             if$
                             }
                         if$
                         }
                     if$
                     }
                 if$
                 }
             if$
             }
         if$
         }
     if$
     }
  if$
}

%%% まず、author -> year -> absorder -> order -> month -> title で sort.key$ を
%%% 作成する。一回目のソートで利用する．
FUNCTION {presort.one}
{ calc.cyear
  pop$
  ""
  sort.label.abb *
  " "
  bst.no.sort #0 = not
    { * order.cited int.to.str$ add.zero.to.number * " " * }
    { * " " * }
  if$
  is.kanji.entry
    { bst.mixed.order #0 =
       { "" }
       { " " }
     if$
    }
    { " " }
  if$
  "" *
  bst.sort.entry.type #0 = not
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    % absorder が empty のときは 0 のときと一緒 /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          % 999 のときは zz 
          { "zzz " * }
          { absorder add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { "/// " * }
             { absorder add.zero.to.number * " " * }
            if$
          }
         if$
       }
       % absorder field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  " " *
  order empty$
    % order が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          % 999 のときは zz 
          { "zzz " * }
          { order add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { "/// " * }
             { order add.zero.to.number * " " * }
            if$
          }
         if$
       }
       % order field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  month empty$
    % month が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { * "/// " * }
       { month "999" =
          % 999 のときは zz 
          { * month add.zero.to.number * "zzz " * }
          { month add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { * month add.zero.to.number * "/// " * }
             { * month add.zero.to.number * " " * }
            if$
          }
         if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug．デバッグするときにはこの関数で作成される sort.key$の中身を出力
  % する．
  jecon.debug #0 = not
    { "\verb|sort.key$| = ``\texttt{" write$
      sort.key$ write$
      "}''\\" write$
      newline$
    }
    'skip$
  if$
}

%%% これは absorder -> author -> year -> order -> month -> title で sort.key$ を
%%% 作成する。最終的な並べ替えはこちらで指定する sort.key$ でおこなう。
FUNCTION {presort.two}
{ bst.no.sort #0 = not
    %% 並べ替えしない(引用順でそのまま並べる)ケースのための設定．
    { order.cited int.to.str$ add.zero.to.number " " * }
    { "" }
  if$
  bst.sort.year #0 = not
    %% year をキーとして並べるための設定．
    { is.kanji.entry.two
        %% 日本語文献
        { year convert.year * }
        %% 英語文献
        { year convert.year * }
      if$
    }
    'skip$
  if$
  bst.sort.entry.type #0 = not
    %% エントリーのタイプ別に分けて並べるための設定．
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    % absorder が empty のときは 0 のときと一緒 /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          % 999 のときは zz 
          { "zzz " * }
	  { absorder add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { "/// " * }
	     { absorder add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
       % absorder field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  " " *
  sort.label.abb *
  " " *  
  is.kanji.entry
    { bst.mixed.order #0 =
       { "" }
       { " " }
     if$
    }
    { " " }
  if$
  order empty$
    % order が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          % 999 のときは zz 
          { "zzz " * }
	  { order add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { "/// " * }
	     { order add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
       % order field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  month empty$
    % month が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { * "/// " * }
       { month "999" =
          % 999 のときは zz 
          { * month add.zero.to.number * "zzz " * }
	  { month add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { * month add.zero.to.number * "/// " * }
	     { * month add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug．デバッグするときにはこの関数で作成される sort.key$の中身を出力
  % する．
  jecon.debug #0 = not
    { "\verb|sort.key$| = ``\texttt{" write$
      sort.key$ write$
      "+}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% 以下はデバッグ用のコード
FUNCTION {calc.alabel.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of calc.alabel}\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {calc.flabel.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of calc.flabel}\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {calc.sort.label.abb.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of calc.sort.label.abb}\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {presort.one.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of presort.one (ソート1回目)}\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {presort.two.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of presort.two (ソート2回目)}\\" write$
      newline$ }
    'skip$
 if$
}
%%% デバッグ用コードここまで．

%%% alabel の作成
EXECUTE {calc.alabel.mess}
ITERATE {calc.alabel}

%%% flabel の作成
EXECUTE {calc.flabel.mess}
ITERATE {calc.flabel}

%%%
EXECUTE {calc.sort.label.abb.mess}
ITERATE {calc.sort.label.abb}

%%% presort の実行 
EXECUTE {presort.one.mess}
ITERATE {presort.one}

%%% sort.key$ を利用して文献の並べ替え．一回目の並べ替え．

% これは仮の並び順を決めるためのもので，最終的にはもう一度並べ替えをおこなう．
% 二回並び替えをするのは bst.mixed.order で指定する "同じ年に同じ著者の英語、
% 日本語文献の両方があり、かつ日本語文献の yomi に英語文献の著者と同じものが指
% 定してあるときに、両者を混ぜて表示する"に対応するため．

SORT

% last.sort.label: 一個前の sort.label.abb の値を保持。
FUNCTION {forward.pass}
{ last.sort.label sort.label.abb =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
     "" 'extra.label :=
      sort.label.abb 'last.sort.label :=
    }
  if$
  bst.use.bysame #0 = bst.use.bysame #2 = or
    % 2 のタイプの bysame を使う場合か bysame を利用しない場合
    'skip$
    % 1 のタイプの bysame を使う場合
    % this.author に現在の author (or editor) を代入
    { author empty$
        { editor empty$
          { "" }
          'format.editors.alt
          if$
        }
        'format.authors.alt
      if$
      'this.author :=
      % 現在の author (this.author) が一個前の author (prev.author) と同じか？
      this.author prev.author =
        % 同じなら extra.labe.bysame に bysame を代入
        { "bysame" 'extra.label.bysame := }
        % 同じではないなら prev.author に this.author を代入しておく。
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
      if$
    }
  if$
}

%%% 同じ年、同じ著者の文献が複数あるときの year に a を付けるための関数
FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label empty$ not
    { cyear extra.label * }
    { cyear "" * }
  if$
  "" field.or.null *
  'cyear :=
  % next.extra に extra.label を代入
  extra.label 'next.extra :=
}

%%% bysame を付ける。
ITERATE {forward.pass}

%%% 同じ著者の同じ年の文献が複数あるとき a を付ける。
REVERSE {reverse.pass}

%%% ２回目の並べ替え．これで最終的に文献の並び順が選択される．
EXECUTE {presort.two.mess}
ITERATE {presort.two}

%%% sort.key$ を利用して文献の並べ替え (２回目)
SORT

FUNCTION {reset.prev.author}
{ "xxyyzz" 'prev.author := }

EXECUTE {reset.prev.author}

FUNCTION {forward.pass.two}
{ bst.use.bysame #1 =
    % Type 1 の bysame を使うケース。
    { author empty$
        { editor empty$
          { "" }
          'format.editors.alt
          if$
        }
        'format.authors.alt
     if$
     'this.author :=
     % 現在の author (this.author) が一個前の author (prev.author) と同じか？
     this.author prev.author =
        % 同じなら extra.labe.bysame に bysame を代入
        { "bysame" 'extra.label.bysame := }
        % 同じではないなら prev.author に this.author を代入しておく。
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
     if$
    }
    % bysame を利用しないか、Type 2 の bysame を使うケースではなにもしない。
   'skip$
  if$
}

ITERATE {forward.pass.two}

FUNCTION{punctuation}
{
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  "%"                                                                    write$ newline$
  "%  This bbl file is created by jecon.bst ver." jecon.version *        write$ newline$
  "%  The latest jecon.bst is available at"                              write$ newline$
  "%  <http://shirotakeda.org/ja/tex-ja/jecon-ja.html>"             write$ newline$
  "%"                                                                    write$ newline$
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  newline$
}

EXECUTE {punctuation}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  bst.use.bysame #0 =
     % bysame を使わないケース
     'skip$
     % bysame を使うケース
     { "%%% Definition of \bysame" write$ newline$
       "\ifx\undefined\bysame" write$ newline$
       "\newcommand{\bysame}{" bst.bysame.definition * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$
       "%%% Definition of \bysamejp" write$ newline$
       "\ifx\undefined\bysamejp" write$ newline$
       "\newcommand{\bysamejp}{" bst.bysame.definition.jp * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$
     }
  if$
  %% 数字を漢数字に変換するときの
  bst.kansuji.jp #0 =
     'skip$
     { "%%% Definition of \tatebo" write$ newline$
       "\ifx\undefined\tatebo" write$ newline$
       "\newcommand{\tatebo}{" bst.tatebo.definition * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$ }
  if$
  %% 文献に number index を付けるときの:
  bst.use.number.index #0 =
     'skip$
     { bst.number.index.digit "1" =
         % 一桁のとき
         { bst.number.index.bibhang.one }
         { bst.number.index.digit "2" =
            % 二桁のとき
            { bst.number.index.bibhang.ten }
            % 三桁以上のとき
            { bst.number.index.bibhang.hund }
           if$
         }
       if$
       'hang :=
       "%%% Redefinition of \bibhang" write$ newline$
       "\ifx\undefined\bibhang" write$ newline$
       "\relax" write$ newline$
       "\else" write$ newline$
       "\setlength{\bibhang}{"
       hang * "}" * write$ newline$ 
       "\fi" write$ newline$ newline$
       }
  if$

  bst.thebibliography.begin

  %% 変数 index を初期化している．
  #0 'index :=
}

FUNCTION {end.bib}
{
  bst.thebibliography.end
 }

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

%% 各エントリーにそのエントリーのタイプを実行する．つまり，article エントリー
%% には article という関数を実行する等．
ITERATE {call.type$}

EXECUTE {end.bib}

% 終．

% --------------------
% Local Variables:
% fill-column: 80
% mode: bst
% coding: utf-8-dos
% End:

