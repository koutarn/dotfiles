UsePlugin 'aho-bakaup.vim'
"==================================
"aiya000/aho-backup.vim
"==================================
let g:bakaup_backup_dir = expand('~/.cache/nvim/aho-bakaup')
let g:bakaup_auto_backup = 1

nnoremap <silent><leader>fb <Cmd>BakaupExplore<CR>

"use aho backup with Fern
"https://github.com/aiya000/aho-bakaup.vim/wiki/Use-aho-bakaup-with-Fern
function! s:init_bakaup() abort
  command! BakaupExplore execute printf("Fern %s", fnameescape(g:bakaup_backup_dir))
  silent! delcommand BakaupTexplore
  silent! delcommand BakaupVexplore
  silent! delcommand BakaupSexplore
endfunction

augroup vimrc_ahobackup
    autocmd!
    autocmd VimEnter * call s:init_bakaup()
augroup END
