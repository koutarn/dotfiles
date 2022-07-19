-- search in the current window
vim.keymap.set({ "n", "x" }, "<Leader>/r", '<Cmd>lua require("reacher").start()<CR>')

-- search in the all windows in the current tab
vim.keymap.set({ "n", "x" }, "<Leader>/w", '<Cmd>lua require("reacher").start_multiple()<CR>')

-- search in the current line
vim.keymap.set({ "n", "x" }, "<Leader>/l", function()
  require("reacher").start({
    first_row = vim.fn.line("."),
    last_row = vim.fn.line("."),
  })
end)

local group = "reacher_setting"
vim.api.nvim_create_augroup(group, {})
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = group,
    pattern = { "reacher" },
    callback = function()
        vim.keymap.set("i", "<CR>", '<ESC>', { buffer = true })
        vim.keymap.set("n", "<CR>", '<Cmd>lua require("reacher").finish()<CR>', { buffer = true })
        vim.keymap.set({ "n", "i" }, "<ESC>", '<Cmd>lua require("reacher").cancel()<CR>', { buffer = true })

        -- 移動
        vim.keymap.set("n", "j", '<Cmd>lua require("reacher").next()<CR>', { buffer = true })
        vim.keymap.set("n", "k", '<Cmd>lua require("reacher").previous()<CR>', { buffer = true })
        vim.keymap.set("n", "h", '<Cmd>lua require("reacher").side_previous()<CR>', { buffer = true })
        vim.keymap.set("n", "l", '<Cmd>lua require("reacher").side_next()<CR>', { buffer = true })
        vim.keymap.set("n", "n", '<Cmd>lua require("reacher").next()<CR>', { buffer = true })
        vim.keymap.set("n", "N", '<Cmd>lua require("reacher").previous()<CR>', { buffer = true })
        vim.keymap.set("n", "gg", '<Cmd>lua require("reacher").first()<CR>', { buffer = true })
        vim.keymap.set("n", "G", '<Cmd>lua require("reacher").last()<CR>', { buffer = true })
    end,
})
