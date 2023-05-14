nosilent_opts = { noremap=true, silent=false }
function keymap(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force',options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

function reload_settings()
  for _, value in ipairs(setting_files) do
    package.loaded[value] = nil
  end
  vim.cmd(':source ' .. init_path)
end

--カーソル位置の保存設定をLua化したもの。
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = { '*' },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
