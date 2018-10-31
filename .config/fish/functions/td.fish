#tmux + cd
function td -d "td pane-number directory"

  #not args
  #    if not count $argv >/dev/null
  #      echo "USAGE :td pane-number directory"
  #      return 1
  #    end

  #tmux
  #  tmux list-pane
  #  tmux display-panes

  #select
    set SELECT_PANE (tmux list-pane | fzf --multi)
    echo $SELECT_PANE
    tmux select-pane $SELECT_PANE
end
