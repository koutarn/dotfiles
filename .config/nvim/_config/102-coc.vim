UsePlug 'coc.nvim'
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
  autocmd CursorHold * silent call CocActionAsync('highlight')
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
nnoremap <Leader>;m <Cmd>CocCommand fzf-preview.Bookmarks<CR>
nnoremap <Leader>;l <Cmd>CocCommand fzf-preview.Lines<CR>
nnoremap <Leader>;z <Cmd>CocCommand fzf-preview.OldFiles<CR>
nnoremap <Leader>;p <Cmd>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <Leader>;d <Cmd>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <Leader>;; <Cmd>CocCommand fzf-preview.Buffers<CR>
nnoremap <Leader>;q <Cmd>CocCommand fzf-preview.QuickFix<CR>
nnoremap <Leader>;c <Cmd>CocCommand fzf-preview.CommandPalette<CR>
nnoremap <Leader>;t <Cmd>CocCommand fzf-preview.TodoComments<CR>
nnoremap <Leader>;ff :CocCommand fzf-preview.ProjectGrep<Space>
nnoremap <Leader>;f; <Cmd>CocCommand fzf-preview.ProjectGrepRecall<CR>
nnoremap <Leader>;gl <Cmd>CocCommand fzf-preview.GitLogs<CR>
nnoremap <Leader>;ga <Cmd>CocCommand fzf-preview.GitActions<CR>
nnoremap <Leader>;gb <Cmd>CocCommand fzf-preview.GitBranches<CR>
nnoremap <Leader>;j <Cmd>CocCommand fzf-preview.Jumps<CR>

set viminfo='1000

let g:fzf_preview_floating_window_rate = 0.9

" fzf window position settings
let g:fzf_preview_direct_window_option = ''

" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }

" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" jump to the buffers by default, when possible
let g:fzf_preview_buffers_jump = 0

if executable('bat')
  let g:fzf_preview_command = 'bat --color=always --plain {-1}'
  let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
else
  let g:fzf_preview_command = 'cat'
  let g:fzf_preview_lines_command = 'cat -n'
  let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'ansi'
endif

if executable('rg')
  " Commands used for project grep
  " let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'
  let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'
  " Commands used to get the file list from current directory
  let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
endif

" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
if executable('rg')
    let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
else
    let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'
endif

" Commands used to get the file list from git repository
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'


" Commands used to get the git status file list
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'

" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
\ g:fzf_preview_command


" MRU and MRW cache directory
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

" If this value is not 0, disable mru and mrw
let g:fzf_preview_disable_mru = 0

" Limit of the number of files to be saved by mru
let g:fzf_preview_mru_limit = 1000

" Commands used for current file lines

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Cache directory for mru and mrw
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_preview_key_bindings = ''
" let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Specify the color of fzf
let g:fzf_preview_fzf_color_option = ''

" Set the processes when selecting an element with fzf
let g:fzf_preview_custom_processes = {}
" For example, set split to ctrl-s
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file')
" on coc extensions
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
" let g:fzf_preview_custom_processes['open-file']['ctrl-s'] = g:fzf_preview_custom_processes['open-file']['ctrl-x']
" call remove(g:fzf_preview_custom_processes['open-file'], 'ctrl-x')

" Use as fzf preview-window option
let g:fzf_preview_fzf_preview_window_option = ''
" let g:fzf_preview_fzf_preview_window_option = 'up:30%'

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" Use fzf history option
" let g:fzf_preview_history_dir = false
" let g:fzf_preview_history_dir = '~/.fzf'

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 5000

