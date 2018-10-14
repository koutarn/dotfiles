function code_mode

    #windowの作成
    tmux new-window -c ~/Project -n CODE_MODE

    #windowの選択
    tmux select-window -t CODE

    #画面を分割

    tmux split-window -c $HOME -v -l 20
    tmux select-pane -t 1
    tmux split-window -c $HOME -h -p 40

    #メインのペインをアクティブにする
    tmux select-pane -t 1
end

