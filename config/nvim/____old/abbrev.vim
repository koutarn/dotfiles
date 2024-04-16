"  "abbrev の自動生成を行う
"  "https://github.com/monaqa/dotfiles/blob/424b0ab2d7623005f4b79544570b0f07a76e921a/.config/nvim/scripts/abbr.vim#L16-L34
"  function! s:make_abbrev_rule(rules)
"    let keys = uniq(sort(map(copy(a:rules), "v:val['from']")))
"    for key in keys
"      let rules_with_key = filter(copy(a:rules), "v:val['from'] ==# '" .. key .. "'")
"      let dict = {}
"      for val in rules_with_key
"        if has_key(val, 'prepose')
"          let dict[val['prepose'] .. ' ' .. key] = (val['to'])
"        else
"          let dict[key] = val['to']
"        endif
"      endfor
"      exec 'cnoreabbrev <expr> ' .. key .. ' '
"      \ .. '(getcmdtype() !=# ":")? "' .. key .. '" : '
"      \ .. 'get(' .. string(dict) .. ', getcmdline(), "' .. key .. '")'
"    endfor
"  endfunction

"  call s:make_abbrev_rule([
"  \   {'from': 'co', 'to': 'CocCommand'},
"  \   {'from': 'cu', 'to': 'CocUpdate'},
"  \   {'prepose': 'CocCommand', 'from': 's', 'to': 'snippets.editSnippets'},
"  \   {'from': 'cl', 'to': 'CocList'},
"  \   {'prepose': 'CocList', 'from': 'm', 'to': 'marketplace'},
"  \   {'prepose': 'CocList', 'from': 'e', 'to': 'extensions'},
"  \   {'from': 'g', 'to': 'Gina'},
"  \   {'from': 'gina', 'to': 'Gina'},
"  \   {'from': 'ga', 'to': 'Gina add'},
"  \   {'prepose': 'Gina', 'from': 'a', 'to': 'add'},
"  \   {'prepose': 'Gina add', 'from': 'a', 'to': '-A'},
"  \   {'from': 'gb', 'to': 'Gina blame'},
"  \   {'prepose': 'Gina', 'from': 'b', 'to': 'blame'},
"  \   {'from': 'gc', 'to': 'Gina commit'},
"  \   {'prepose': 'Gina', 'from': 'c', 'to': 'commit'},
"  \   {'prepose': 'Gina commit', 'from': 'a', 'to': '--amend'},
"  \   {'prepose': 'Gina commit', 'from': 'm', 'to': '-m'},
"  \   {'from': 'gch', 'to': 'Gina checkout'},
"  \   {'from': 'gsw', 'to': 'Gina switch'},
"  \   {'prepose': 'Gina', 'from': 'sw', 'to': 'switch'},
"  \   {'prepose': 'Gina switch', 'from': 'c', 'to': '--create'},
"  \   {'from': 'gp', 'to': 'Gina push'},
"  \   {'prepose': 'Gina', 'from': 'p', 'to': 'push'},
"  \   {'prepose': 'Gina push', 'from': 'o', 'to': 'origin'},
"  \   {'prepose': 'Gina push origin', 'from': 'm', 'to': 'master'},
"  \   {'prepose': 'Gina push origin', 'from': 'd', 'to': 'dev'},
"  \   {'from': 'gs', 'to': 'Gina status -s --opener=split'},
"  \   {'prepose': 'Gina', 'from': 's', 'to': 'status -s --opener=split'},
"  \   {'from': 'gl', 'to': 'Gina log -s --opener=split'},
"  \   {'prepose': 'Gina', 'from': 'l', 'to': 'log -s --opener=split'},
"  \   {'from': 'ver', 'to': 'verbose'},
"  \   {'prepose': 'verbose', 'from': 'a', 'to': 'autocmd'},
"  \   {'prepose': 'verbose', 'from': 'f', 'to': 'function'},
"  \   {'prepose': 'verbose', 'from': 'c', 'to': 'command'},
"  \   {'from': 'plugstatus', 'to': 'PlugStatus'},
"  \   {'from': 'plugupdate', 'to': 'PlugUpdate'},
"  \   {'from': 'pu', 'to': 'PlugUpdate'},
"  \   {'from': 'repo', 'to': 'Repo'},
"  \ ])
