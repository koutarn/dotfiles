-- ====================================================================================================
-- flutter開発用プラグイン、内部的にdartlsを使用しているのでnvim-lspのほうでインストールしないこと
-- ====================================================================================================

-- language serverがバッファにアタッチされたときに実行する関数
local custom_attach = function(client, bufnr)
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


-- alternatively you can override the default configs
require("flutter-tools").setup {
  ui = {
    border = "single",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = false,
    }
  },

  -- flutter_path = "~/flutter", -- <-- this takes priority over the lookup
  -- flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  -- fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
      enabled = true
  },
  closing_tags = {
    prefix = "-> ", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = false,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "40vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = custom_attach,
    -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    capabilities = function(config)
      config.specificThingIDontWant = false
      return config
    end,
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
    }
  }
}
