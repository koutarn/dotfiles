function code_mode

    #windowの作成
    tmux new-window -c ~/Project -n CODE_MODE

    #windowの選択
    tmux select-window -t CODE_MODE

    #画面を分割
    tmux split-window -c $HOME -v -l 20
    tmux split-window -c $HOME -h -p 50

    #メインのペインをアクティブにする
    tmux select-pane -t 1
    vim
end

