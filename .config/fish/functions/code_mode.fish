function code_mode
    tmux new-window

    #画面を分割して右下はtopコマンド実行
    tmux select-pane -t 0
    tmux split-window -v -l 25
    tmux select-pane -t 1
    tmux split-window -h -l 80

    #メインのペインをアクティブにする
    tmux select-pane -t 0
end

