-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

local function keymap(mode, lhs, rhs,opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

-- Emacs風バインド
keymap('c','<C-e>','<End>')
keymap('c','<C-a>','<Home>')
keymap('c','<C-h>','<LEFT>')
keymap('c','<C-k>','<UP>')
keymap('c','<C-j>','<DOWN>')
keymap('c','<C-l>','<RIGHT>')
keymap('i','<C-a>','<Home>')
keymap('i','<C-h>','<LEFT>')
keymap('i','<C-k>','<UP>')
keymap('i','<C-j>','<DOWN>')
keymap('i','<C-l>','<RIGHT>')

-- インデントに合せてペースト
keymap('n','p',']p')
keymap('n','P',']P')

-- USキーボード用に入れ替える。
-- keymap('n',':',';')
-- keymap('n',';',':')
-- keymap('v',':',';')
-- keymap('v',';',':')

-- 移動
keymap('v','v','$h')
keymap('n','<S-k>','10gk')
keymap('n','<S-j>','10gj')
keymap('v','<S-k>','10gk')
keymap('v','<S-j>','10gj')

-- ノーマルモードに戻す
keymap('i','jj','<ESC>')
keymap('x','jj','<ESC>')
keymap('c','jj','<C-c>')

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
