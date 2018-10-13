#/bin/sh

#===================================---
#ファイルの取得を行う
#このシェルを実行後にpushする
#===================================
get_file()
{
  # 移動元ディレクトリの存在確認
    if [ ! -e $1 ] ; then
        echo "移動元ディレクトリ${1}が存在しません。"
        return
    fi

    $name = dirname $1
    echo $1
    echo $name
    #ファイルの移動を行う
    #cp "~/${name}" "./${name} "
}

#vim関係
get_file ~/.vim
get_file ~/.vimrc

#シェル関係
get_file ~/.bashrc
get_file ~/.zshrc
get_file ~/.config

#その他
get_file ~/.gdbinit
get_file ~/.tmux.conf
