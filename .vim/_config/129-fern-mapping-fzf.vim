UsePlugin 'fern-mapping-fzf.vim'
"===========================================
" 'LumaKernel/fern-mapping-fzf.vim'
"===========================================
let g:fern#mapping#fzf#disable_default_mappings = 1
function! s:init_fern_mapping_fzf() abort
  nmap <buffer><Leader>ff <Plug>(fern-action-fzf-both)
endfunction

augroup my-fern-mapping-fzf
	  autocmd! *
	  autocmd FileType fern call s:init_fern_mapping_fzf()
augroup END
