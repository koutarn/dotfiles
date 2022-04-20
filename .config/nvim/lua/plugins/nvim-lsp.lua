-- local nvim_lsp = require('lspconfig')

-- -- language serverがバッファにアタッチされたときに実行する関数
-- local on_attach = function(client, bufnr)
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--     local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--     -- map用オプション
--     local opts = { noremap=true, silent=true }

--     -- `vim.lsp.*`関数のマッピング（多いので省略）
--     buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- -- lsp_installerの設定
-- local lsp_installer = require("nvim-lsp-installer")

-- -- デフォルトアイコンが見分けつかないので設定
-- -- その他のデフォルト設定は[READMEを参照](https://github.com/williamboman/nvim-lsp-installer#default-configuration)
-- lsp_installer.settings({
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })

-- -- サーバー起動時に自動でon_attachをアタッチする
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     opts.on_attach = on_attach
--     opts.capabilities = capabilities

--     server:setup(opts)
--     vim.cmd [[ do User LspAttachBuffers ]]
-- end)

-- require("lsp-colors").setup({
--   Error = "#db4b4b",
--   Warning = "#e0af68",
--   Information = "#0db9d7",
--   Hint = "#10B981"
-- })

-- require("trouble").setup {
--     icons = ture,
--     fold_open = "v", -- icon used for open folds
--     fold_closed = ">", -- icon used for closed folds
--     indent_lines = false, -- add an indent guide below the fold icons
--     signs = {
--         -- icons / text used for a diagnostic
--         error = "error",
--         warning = "warn",
--         hint = "hint",
--         information = "info"
--     },
--     use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
-- }

-- require"fidget".setup{} ]]
