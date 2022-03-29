"UsePlug 'coc.nvim'
"=======================
"'neoclide/coc.nvim'
"=======================

"coc command
nnoremap <Leader>;<space> <Cmd>CocCommand<CR>
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)

nnoremap <silent>gh <Cmd>call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup vimrc_coc
  autocmd!
  " autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"インテリセンスをうまいことやるやつ
function! s:coc_select_settings()
    let pre_str = getline('.')[col('.') - 2]
    if pumvisible()
        return coc#_select_confirm()
    elseif pre_str ==# ' ' || pre_str ==# ''
        return ';;'
    else
        return coc#refresh()
    endif
endfunction
inoremap <silent><expr> ;; <SID>coc_select_settings()

" =========================
" coc-snippets
" =========================
" imap ;; <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" =========================
" coc-fzf-preview
" =========================
nnoremap <silent><Leader>;m     :CocCommand fzf-preview.Bookmarks<CR>
nnoremap <silent><Leader>;l     :CocCommand fzf-preview.Lines<CR>
nnoremap <silent><Leader>;z     :CocCommand fzf-preview.OldFiles<CR>
nnoremap <silent><Leader>;p     :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent><Leader>;d     :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent><Leader>;;     :CocCommand fzf-preview.Buffers<CR>
nnoremap <silent><Leader>;q     :CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent><Leader>;c     :CocCommand fzf-preview.CommandPalette<CR>
nnoremap <silent><Leader>;t     :CocCommand fzf-preview.TodoComments<CR>
nnoremap         <Leader>;ff    :CocCommand fzf-preview.ProjectGrep<Space>
nnoremap <silent><Leader>;f;    :CocCommand fzf-preview.ProjectGrepRecall<CR>
nnoremap <silent><Leader>;gl    :CocCommand fzf-preview.GitLogs<CR>
nnoremap <silent><Leader>;ga    :CocCommand fzf-preview.GitActions<CR>
nnoremap <silent><Leader>;gb    :CocCommand fzf-preview.GitBranches<CR>
nnoremap <silent><Leader>;<C-o> :CocCommand fzf-preview.Jumps<CR>

set viminfo='1000

let g:fzf_preview_floating_window_rate = 0.9
let g:fzf_preview_disable_mru = 0
let g:fzf_preview_mru_limit = 2000

"devcon
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_dev_icons_limit = 5000
