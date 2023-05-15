-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Unbind
keymap('', 'Q', '<Nop>')
keymap('', 'ZZ', '<Nop>')
keymap('', 'ZQ', '<Nop>')
keymap('', 's', '<Nop>')
keymap('', 'S', '<Nop>')
keymap('', '<C-z>', '<Nop>')
keymap('', '<C-g>', '<Nop>')
keymap('', 'gR', '<Nop>')

-- 保持しない
keymap('n', 'x', '\"_x')
keymap('n', 'X', '\"_X')

keymap({'c','i'},'<C-e>','<End>',nosilent_opts)
keymap({'c','i'},'<C-a>','<Home>',nosilent_opts)
keymap({'c','i'},'<C-h>','<LEFT>',nosilent_opts)
keymap({'c','i'},'<C-k>','<UP>',nosilent_opts)
keymap({'c','i'},'<C-j>','<DOWN>',nosilent_opts)
keymap({'c','i'},'<C-l>','<RIGHT>',nosilent_opts)
keymap({'n','v'},':',';',nosilent_opts)
keymap({'n','v'},';',':',nosilent_opts)

-- インデントに合せてペースト
keymap('n','p',']p')
keymap('n','P',']P')

-- 移動
keymap('v','v','$h')
keymap({'n','v'},'<S-k>','10gk')
keymap({'n','v'},'<S-j>','10gj')

-- ノーマルモードに戻す
keymap('i','jj','<ESC>')
keymap('c','jj','<C-c>')
keymap('t','jj','<C-\\><C-n>')

-- 'Buffer
keymap('n','<Leader>y',':<C-u>bprevious<CR>')
keymap('n','<Leader>u',':<C-u>bnext<CR>')

-- 'window
keymap('n','<Leader>-',':<C-u>split<CR>')
keymap('n','<Leader>\\',':<C-u>vsplit<CR>')
keymap('n','<Leader>x',':<C-u>close<CR>')

-- 'ウィンドウ間を移動
keymap('n','<Leader>h','<C-w>h')
keymap('n','<Leader>j','<C-w>j')
keymap('n','<Leader>k','<C-w>k')
keymap('n','<Leader>l','<C-w>l')

-- 'インデント整形
keymap('v','>','>gv')
keymap('v','<','<gv')
keymap('n','==','gg=G')

-- Undoポイントの設置
-- thx https://zenn.dev/kato_k/articles/vim-tips-no006
keymap('i','<C-w>','<C-g>u<C-w>')
keymap('i','<C-u>','<C-g>u<C-u>')
keymap('i','<C-m>','<C-g>u<C-m>')

-- 設定の再読み込み
-- keymap('n','<Leader>fr',':Source<CR>')

-- TODO: カウントが受け付けない
keymap('n','<Leader>o',':for i in range(v:count1) | call append(line(\'.\'), \'\') | endfor<CR>')
keymap('n','<Leader>O',':for i in range(v:count1) | call append(line(\'.\')-1, \'\') | endfor<CR>')
