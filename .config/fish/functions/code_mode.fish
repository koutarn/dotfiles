function code_mode

    #windowの作成
    tmux new-window -c ~/Project -n CODE

    #windowの選択
    tmux select-window -t CODE

    #画面を分割

    tmux split-window -c $HOME -v -l 15
    tmux split-window -c $HOME -h -p 50

    #メインのペインをアクティブにする
    tmux select-pane -t 1
end

