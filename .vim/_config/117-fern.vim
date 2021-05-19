UsePlugin 'fern.vim'
" =========================
" 'lambdalisue/fern.vim'
" =========================
nnoremap <Leader>fo :Fern . -stay -drawer -keep -toggle -reveal=%<CR>

function! s:init_fern() abort
	" Write custom code here
  nnoremap g <Plug>(fern-action-grep)
endfunction

augroup my-fern
	autocmd FileType fern call s:init_fern()
augroup END
