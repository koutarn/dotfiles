function code_mode

    #windowの作成
    tmux new-window -n code

    #windowの選択
    tmux select-window -t code

    #画面を分割
    tmux split-window -c $HOME -v -l 10

    #メインのペインをアクティブにする
    tmux select-pane -t 1
end

