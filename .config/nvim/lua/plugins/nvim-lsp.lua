local nvim_lsp = require('lspconfig')

-- language serverがバッファにアタッチされたときに実行する関数
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- map用オプション
    local opts = { noremap=true, silent=true }

    -- `vim.lsp.*`関数のマッピング（多いので省略）
    buf_set_keymap('n', 'z[', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'z]', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'zh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'z-', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', 'z=', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})

-- lsp_installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
        border = "double",
    },
    keymaps = {
        toggle_server_expand = '<CR>',
        install_server = 'i',
        update_server = 'u',
        uninstall_server = 'x',
    },
})
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.on_attach = on_attach
    opts.capabilities = capabilities

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- 色を付ける
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

-- Progress UI
require"fidget".setup{}

-- LSPにUIやコマンドを追加
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = " ",

    -- code action title icon
    code_action_icon = "",
    code_action_prompt = {
        enable = false,
        sign = false,
        sign_priority = 40,
        virtual_text = false,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false,
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = false,
}

local map = vim.api.nvim_buf_set_keymap
map(0, "n", "zr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
map(0, "n", "za", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
map(0, "x", "za", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
-- map(0, "n", "zh",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})

-- trouble
require("trouble").setup {
    position = "bottom",
    height = 10,
    width = 50,
    icons = true,
    mode = "workspace_diagnostics",
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = false,
    action_keys = {
        previous = "k",
        next = "j",
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = {"<cr>", "<tab>"},
        jump_close = "o",
        toggle_preview = "p",
        hover = "zh",

        -- 無効化
        open_split = {},
        open_vsplit = {},
        open_tab = {},
        toggle_mode = {},
        preview = {},
        close_folds = {},
        open_folds = {},
        toggle_fold = {},
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = {"lsp_definitions"},
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false
}

vim.api.nvim_set_keymap("n", "zz", "<cmd>TroubleToggle<cr>",{silent = true, noremap = true})
