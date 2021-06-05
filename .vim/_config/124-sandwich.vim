UsePlugin 'vim-sandwich'
"====================================================================
"'machakann/vim-sandwich'
"====================================================================
" 日本語のカッコ
" thx https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugins/sandwich.vim
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
\   {'buns': ['（', '）'], 'nesting': 1, 'input': ['j(', 'j)', 'jp']},
\   {'buns': ['「', '」'], 'nesting': 1, 'input': ['j[', 'j]', 'jb']},
\   {'buns': ['【', '】'], 'nesting': 1, 'input': ['j{', 'j}', 'jk']},
\ ]
