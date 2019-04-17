"====================================================================
"Goyo.vim用の関数
"====================================================================
function! GoyoMode()
  " call
  call feedkeys(":Fontzoom 11\<CR>")
  call feedkeys(":WCenter 65\<CR>")
  call feedkeys(":Goyo 70%x70%\<CR>")
  call feedkeys(":WSetAlpha 245\<CR>")

  " set
  set showtabline=0
  set nospell noci nosi noai nolist noshowmode noshowcmd
  set scrolloff=999
  set bg=dark

  "color scheme
  colors material-theme

  "選択した段落のみ目立たせる
  Limelight

endfunction

function! LeaveGoyoMode()
  " call
  call feedkeys(":Fontzoom 10\<CR>")
  call feedkeys(":WCenter 65\<CR>")
  call feedkeys(":WSetAlpha 255\<CR>")
  call feedkeys(":FixWhitespace\<CR>")

  " set
  set showtabline=0
  set nospell ci si ai list showmode showcmd
  set scrolloff=30
  set bg=dark

  "color scheme
  colors onedark

  "色々元に戻す
  Limelight!
  Goyo!

endfunction
