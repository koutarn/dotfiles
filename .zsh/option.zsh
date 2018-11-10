#色の定義
local DEFAULT=$'%{^[[m%}'$
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$

#補完に関するオプション
setopt correct                #入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt auto_list              #補完候補を一覧表示にする
setopt auto_param_slash       #ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs              #ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types             #補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu              #補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys        #カッコの対応などを自動的に補完
setopt interactive_comments   #コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst      #コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word       #単語の途中でもカーソル位置で補完
setopt always_last_prompt     #カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit        #日本語ファイル名等8ビットを通す
setopt extended_glob          #拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots               #明確なドットの指定なしで.から始まるファイルをマッチ

setopt auto_cd # ディレクトリ名を入力するだけでcdできるようにする
setopt nobeep # ビープを鳴らさない

#history
setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups # 重複するコマンドは古い法を削除する
setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks # 余分な空白は詰めて記録
setopt hist_verify # `!!`を実行したときにいきなり実行せずコマンドを見せる


#補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

#sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                              /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#psコマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#補完をする際に選択画面を出す
zstyle ':completion:*:default' menu select=2

#ここで指定した文字は単語区切りとみなされる
#/ も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

