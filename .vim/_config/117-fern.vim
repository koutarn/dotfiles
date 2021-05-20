UsePlugin 'fern.vim'
" =========================
" 'lambdalisue/fern.vim'
" =========================
nnoremap <silent><Leader>fo :Fern . -stay -drawer -keep -toggle -reveal=% -width=40<CR>

let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '

function! s:init_fern() abort
  " Write custom code here
  nmap <silent><buffer> q <C-u>:quit<CR>
  nmap <buffer><Leader>r <Plug>(fern-action-rename)
  nmap <buffer><Leader>c <Plug>(fern-action-copy)
  nmap <buffer><Leader>n <Plug>(fern-action-new-file)
  nmap <buffer><Leader>N <Plug>(fern-action-new-dir)
  nmap <buffer><Leader>d <Plug>(fern-action-trash)

  nmap <buffer> <Leader>g <Plug>(fern-action-grep)
  nmap <buffer> <Leader>ff <Plug>(fern-action-fzf-both)

  nmap <buffer> <Leader>fi <Plug>(fern-action-include)
  nmap <buffer> <Leader>fe <Plug>(fern-action-exclude)

  nmap <buffer> H <Plug>(fern-leave-and-tcd)
  nmap <buffer> L <Plug>(fern-enter-and-tcd)
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> l <Plug>(fern-action-open-or-expand)
  nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)

  nmap <buffer> <Plug>(fern-enter-and-tcd)
  \ <Plug>(fern-action-enter)
  \ <Plug>(fern-wait)
  \ <Plug>(fern-action-tcd:root)

  nmap <buffer> <Plug>(fern-leave-and-tcd)
  \ <Plug>(fern-action-leave)
  \ <Plug>(fern-wait)
  \ <Plug>(fern-action-tcd:root)


endfunction

augroup my-fern
	autocmd FileType fern call s:init_fern()
augroup END
