UsePlug 'coc.nvim'
"=======================
"'neoclide/coc.nvim'
"=======================
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-vimlsp',
  \ 'coc-python'
  \]

nnoremap <Leader>' :CocCommand<CR>
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" "tabで選択
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> ;; pumvisible() ? coc#_select_confirm() : coc#refresh()


" =========================
" coc-snippets
" =========================
" imap ;; <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" =========================
" coc-fzf-preview
" =========================
nnoremap <Leader>p :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <Leader>; :CocCommand fzf-preview.Buffers<CR>

set viminfo='1000

let g:fzf_preview_floating_window_rate = 0.9
let g:fzf_preview_direct_window_option = ''
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'nowrap' }
let g:fzf_preview_quit_map = 1
let g:fzf_preview_buffers_jump = 0
let g:fzf_preview_command = 'cat'                               " Not installed bat
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'
let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')
let g:fzf_preview_disable_mru = 0
let g:fzf_preview_mru_limit = 1000
let g:fzf_preview_lines_command = 'cat -n'                                " Not Installed bat
let g:fzf_preview_preview_key_bindings = ''
let g:fzf_preview_fzf_color_option = ''
let g:fzf_preview_custom_processes = {}
let g:fzf_preview_fzf_preview_window_option = ''
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_dev_icons_limit = 5000
