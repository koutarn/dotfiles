UsePlugin 'fern-mapping-fzf.vim'
"===========================================
" 'LumaKernel/fern-mapping-fzf.vim'
"===========================================
let g:fern#mapping#fzf#disable_default_mappings = 1
function! s:init_fern_mapping_fzf() abort
  nmap <buffer><Leader>ff <Plug>(fern-action-fzf-files)
  nmap <buffer><Leader>fd <Plug>(fern-action-fzf-dirs)
  nmap <buffer><Leader>frf <Plug>(fern-action-fzf-root-files)
  nmap <buffer><Leader>frd <Plug>(fern-action-fzf-root-dirs)
endfunction

augroup vimrc_fern_mapping_fzf
	autocmd!
	autocmd FileType fern call s:init_fern_mapping_fzf()
augroup END
