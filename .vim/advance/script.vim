"====================================================================
"Goyo.vim用の関数
"====================================================================
let g:pre_font_size      = 0
let g:pre_window_size    = 0
let g:pre_alpha          = 0
let g:pre_is_full_screen = 0
let g:pre_color_scheme   = 0
let g:pre_bg             = 0

function! SettingGoyo(font_size,window_size,alpha,is_full_screen,color_scheme,bg)
  " call by arguments
  call feedkeys(":Fontzoom" . a:font_size . "\<CR>")
  call feedkeys(":WSetAlpha" . a:alpha . "\<CR>")
  call feedkeys(":set background=" . a:bg . "\<CR>")

  "fullscreenでないならwindowのサイズを設定する。
  if a:is_full_screen == 1
    call feedkeys(":WToggleFullscreen\<CR>")
  else
    call feedkeys(":WCenter" . a:window_size . "\<CR>")
  endif

  "dafault color scheme
  exe "colors" a:color_scheme
endfunction

function! GoyoMode(font_size,window_size,goyo_size_w,goyo_size_h,alpha,is_full_screen,color_scheme,bg)

  "前回値を保存
  let g:pre_is_full_screen =  a:is_full_screen
  let g:pre_bg             =  &background

  "どうやって保存するか考える
  let g:pre_font_size    = a:font_size
  let g:pre_color_scheme = colorscheme
  let g:pre_window_size  = a:window_size
  let g:pre_alpha        = a:alpha

  "値を設定
  call SettingGoyo(a:font_size,a:window_size,a:alpha,a:is_full_screen,a:color_scheme,a:bg)

  " set
  set showtabline=0
  set nospell noci nosi noai nolist  noshowcmd
  set scrolloff=999

  Limelight
  call feedkeys(":Goyo" . a:goyo_size_w . "%x" . a:goyo_size_h . "%\<CR>")

endfunction

function! LeaveGoyoMode()

  "値を設定
  call SettingGoyo(g:pre_font_size,g:pre_window_size,g:pre_alpha,g:pre_is_full_screen,g:pre_color_scheme,g:pre_bg)

  " set
  set showtabline=0
  set nospell ci si ai list showmode showcmd
  set scrolloff=30

  Limelight!
  Goyo!

endfunction
