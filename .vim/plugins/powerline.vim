"Vimのpluginではない,一応外部のものなのでここに記載
"powerline表示用

set laststatus=2
set showtabline=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
