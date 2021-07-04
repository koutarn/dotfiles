"abbrev の自動生成を行う
"https://github.com/monaqa/dotfiles/blob/424b0ab2d7623005f4b79544570b0f07a76e921a/.config/nvim/scripts/abbr.vim#L16-L34
function! s:make_abbrev_rule(rules)
  let keys = uniq(sort(map(copy(a:rules), "v:val['from']")))
  for key in keys
    let rules_with_key = filter(copy(a:rules), "v:val['from'] ==# '" .. key .. "'")
    let dict = {}
    for val in rules_with_key
      if has_key(val, 'prepose')
        let dict[val['prepose'] .. ' ' .. key] = (val['to'])
      else
        let dict[key] = val['to']
      endif
    endfor
    exec 'cnoreabbrev <expr> ' .. key .. ' '
    \ .. '(getcmdtype() !=# ":")? "' .. key .. '" : '
    \ .. 'get(' .. string(dict) .. ', getcmdline(), "' .. key .. '")'
  endfor
endfunction

call s:make_abbrev_rule([
\   {'from': 'c', 'to': 'CocCommand'},
\   {'from': 'cc', 'to': 'CocConfig'},
\   {'from': 'g', 'to': 'Gina'},
\   {'prepose': 'Gina', 'from': 'a', 'to': 'add'},
\   {'prepose': 'Gina', 'from': 'b', 'to': 'blame'},
\   {'prepose': 'Gina', 'from': 'c', 'to': 'commit'},
\   {'prepose': 'Gina', 'from': 'p', 'to': 'push'},
\   {'prepose': 'Gina add', 'from': 'a', 'to': '-A'},
\   {'prepose': 'Gina', 'from': 's', 'to': 'status -s --opener=split'},
\   {'prepose': 'CocCommand', 'from': 's', 'to': 'snippets.editSnippets'},
\   {'prepose': 'Gina commit', 'from': 'a', 'to': '--amend'},
\   {'prepose': 'Gina commit', 'from': 'm', 'to': '-message'},
\   {'prepose': 'Gina push', 'from': 'o', 'to': 'origin'},
\   {'prepose': 'Gina push origin', 'from': 'm', 'to': 'master'},
\   {'prepose': 'Gina push origin', 'from': 'd', 'to': 'dev'},
\ ])
