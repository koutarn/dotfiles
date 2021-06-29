UsePlugin 'fern.vim'
" =========================
" 'lambdalisue/fern.vim'
" =========================
noremap <silent><Leader>ff <Cmd>Fern . -stay -drawer -keep -toggle -reveal=%<CR>

let g:fern#keepalt_on_edit = 1
let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1
let g:fern#hide_cursor = 0
let g:fern#disable_drawer_auto_resize = 0
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '
let g:fern#drawer_width = 40

function! s:init_fern() abort
    nmap <buffer><Leader>r <Plug>(fern-action-rename)
    nmap <buffer><Leader>c <Plug>(fern-action-copy)
    nmap <buffer><Leader>n <Plug>(fern-action-new-file)
    nmap <buffer><Leader>N <Plug>(fern-action-new-dir)
    nmap <buffer><Leader>d <Plug>(fern-action-trash)

    nmap <buffer><Leader>g <Plug>(fern-action-grep)

    nmap <buffer><Leader>i <Plug>(fern-action-include)
    nmap <buffer><Leader>e <Plug>(fern-action-exclude)

    " nmap <buffer> <C-l> <Plug>(fern-action-redraw)

    "open or move directory
    nmap <buffer>e <Plug>(fern-action-open:system)
    nmap <buffer>h <Plug>(fern-action-collapse)
    nmap <buffer>l <Plug>(fern-action-open-or-expand)
    nmap <buffer><CR> <Plug>(fern-action-open-or-expand)
    nmap <buffer>o <Plug>(fern-action-open-or-expand)

    nmap <buffer>L <Plug>(fern-enter-and-tcd)
    nmap <buffer>H <Plug>(fern-leave-and-tcd)

    nmap <buffer> <Plug>(fern-enter-and-tcd)
    \ <Plug>(fern-action-enter)
    \ <Plug>(fern-wait)
    \ <Plug>(fern-action-tcd:root)

    nmap <buffer> <Plug>(fern-leave-and-tcd)
    \ <Plug>(fern-action-leave)
    \ <Plug>(fern-wait)
    \ <Plug>(fern-action-tcd:root)

endfunction

augroup vimrc_fern
    autocmd!
    autocmd FileType fern call s:init_fern()
augroup END
