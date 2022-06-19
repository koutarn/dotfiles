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
setopt auto_menu                    #補完キー連打で順に補完候補を自動で補完
setopt auto_list                    #補完候補を一覧表示にする
setopt auto_param_keys              #カッコの対応などを自動的に補完
setopt auto_param_slash             #ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
# setopt correct                      #入力しているコマンド名が間違っている場合にもしかして：を出す。
# setopt correct_all                  #コマンド補完を全てで出す
setopt mark_dirs                    #ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types                   #補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_packed                  #補完結果をできるだけ詰める
setopt auto_param_keys              #カッコの対応などを自動的に補完
setopt interactive_comments         #コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst            #コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word             #単語の途中でもカーソル位置で補完
setopt always_last_prompt           #カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit              #日本語ファイル名等8ビットを通す
setopt extended_glob                #拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots                     #明確なドットの指定なしで.から始まるファイルをマッチ
setopt prompt_subst                 #プロンプト定義内で変数置換やコマンド置換を扱う


#history
setopt hist_expire_dups_first       #履歴がいっぱいの時は最も古いものを先ず削除
setopt hist_verify                  #`!!`を実行したときにいきなり実行せずコマンドを見せる
setopt bang_hist                    #!を使った履歴展開を行う(d)
setopt extended_history             #履歴に実行時間も保存する
setopt hist_ignore_dups             #直前と同じコマンドは履歴に追加しない
setopt hist_reduce_blanks           #余分なスペースを削除して履歴に保存する
setopt hist_no_store                #historyコマンドは履歴に登録しない
setopt hist_expand                  #補完時に履歴を自動的に展開
setopt hist_ignore_dups             #入力したコマンドが直前のものと同一なら履歴に登録しない
setopt hist_save_no_dups            #入力したコマンドが直前のものと同一なら古いコマンドのほうを削除する
setopt hist_find_no_dups            #ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
setopt hist_ignore_all_dups         #入力したコマンドを履歴に登録する時、同一がすでに存在した場合登録しない
setopt hist_no_functions            #関数定義のためのコマンドは履歴から削除する
setopt hist_no_store                #履歴参照のコマンドは履歴に登録しない
setopt hist_reduce_blanks           #コマンド中の余分な空白を削除する
setopt inc_append_history           #履歴をインクリメンタルに追加
setopt share_history                #他のシェルのヒストリをリアルタイムで共有する

#その他
setopt auto_cd                      #ディレクトリ名を入力するだけでcdできるようにする
setopt nobeep                       #ビープを鳴らさない
setopt no_list_beep                 #ビープを鳴らさない
setopt no_hist_beep                 #ビープを鳴らさない
setopt sh_word_split                #展開をbashに合わせる
setopt brace_ccl                    #brace展開の拡張　{abc} => a b c
setopt no_flow_control              #Ctrl-s,Ctrl-qを無効化
setopt print_exit_value             #戻り値が0以外の場合戻り値を表示
setopt rm_star_wait                 #rmするときに確認してくれる
setopt no_tify                      #バックグランドジョブが終了時知らせてくれる

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
zstyle ':completion:*:default' menu select=1

#ここで指定した文字は単語区切りとみなされる
#/ も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

