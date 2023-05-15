-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- =============================================
  -- =                Logic
  -- =============================================

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      {'williamboman/mason-lspconfig.nvim'},

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', event = 'LspAttach',opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      -- LSP settings.
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        -- use telescope
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      end

      --
      --  Add any additional override configurati
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- tsserver = {},

        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }
    end
  },
  { --警告等を良い感じに表示してくれる
    'folke/trouble.nvim',
    requires = "nvim-tree/nvim-web-devicons",
    event = 'VeryLazy',
    cmd = 'Trouble',
    config = function()
      -- NOTE:設定をする
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
      keymap("n", "zz", "<cmd>TroubleToggle<cr>",{silent = true, noremap = true})
    end
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter,CmdlineEnter",
    dependencies = {
      -- nvim cmp
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/vim-vsnip',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      -- signature help
      'hrsh7th/cmp-nvim-lsp-signature-help',
      -- icons
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
    },
    config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      -- TODO:文字数制限をつけたい
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = 'single'
          }),
          documentation = cmp.config.window.bordered({
            border = 'single'
          }),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          -- [';;'] = cmp.mapping.complete {},
          [';;'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = {
          { name = 'nvim_lsp' },
          { name = 'cmp_tabnine' },
          { name = 'luasnip' },
          { name = 'emoji' },
          { name = 'path' },
          { name = 'cmd' },
          { name = 'nvim_lsp_signature_help' },
        },
        formatting = {
            format = require('lspkind').cmp_format({
              mode = 'symbol', -- show only symbol annotations
              maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

              -- The function below will be called before any actual modifications from lspkind
              -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
              -- before = function (entry, vim_item)
              --   return vim_item
              -- end
            })
          }
      }
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'nvim_lsp_document_symbol' } }, { { name = 'buffer' } })
      })

     cmp.setup.cmdline(':', {
       mapping = cmp.mapping.preset.cmdline(),
       sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline', keyword_length = 2 } })
      })
    end
  },

  -- 色んな言語のsnippet集
  'rafamadriz/friendly-snippets',

  -- 空白行の表示&削除
  -- TODO:ちょい微妙だから代替えを探したい機運
  {
    'lukoshkin/trailing-whitespace',
    config = function ()
       require'trailing-whitespace'.setup {
          patterns = { '\\s\\+$' },
          palette = { markdown = 'RosyBrown' },
          default_color = 'PaleVioletRed',
       }
    end
  },

  -- マルチカーソル
  {
    'mg979/vim-visual-multi',
    event = "InsertEnter",
    -- init = function()
    --   local t = {}
    --   t["Find Under"] = "<C-k>"
    --   t["Find Subword Under"] = "<C-k>"
    --   vim.g.VM_maps = t
    -- end
  },

  {
    'tzachar/cmp-tabnine',
    build = './install.ps1',
    event = "InsertEnter",
    dependencies = 'hrsh7th/nvim-cmp',
  },

  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    opts = {},
  },

  { -- auto pair
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    config = function() require("nvim-autopairs").setup {} end
  },

  { -- deno関係のプラグインを使えるようにする
    'vim-denops/denops.vim',
    lazy = false, -- denoはランタイムなので遅延を行わない
    cond = function()
      return vim.fn.executable 'deno' == 1
    end
  },

  { --  Migemo を利用してローマ字のまま日本語検索を行う最低限の機能を提供する
    'lambdalisue/kensaku.vim',
    event = 'VeryLazy',
    dependencies = {'vim-denops/denops.vim'},
  },

  { -- 検索時にkensaku.vimを使用できる形に置き換える
    'lambdalisue/kensaku-search.vim',
    event = 'VeryLazy',
    dependencies = {'lambdalisue/kensaku.vim'},
    keymap('c','<CR>','<Plug>(kensaku-search-replace)<CR>'),
  },

  { -- 画面上にfzfで飛ぶ
    'yuki-yano/fuzzy-motion.vim',
    event = 'VeryLazy',
    dependencies = {'lambdalisue/kensaku.vim'},
    config = function()
      vim.keymap.set('n', 'S', '<cmd>FuzzyMotion<CR>')
      vim.cmd("let g:fuzzy_motion_matchers = ['kensaku', 'fzf']")
      vim.cmd('let g:fuzzy_motion_auto_jump = v:true')
    end
  },

  { -- 翻訳をおこなう
    'skanehira/denops-translate.vim',
    event = 'VeryLazy',
    dependencies = {'vim-denops/denops.vim'},
    config = function()
      keymap({'v','x'}, '<Leader>tr', ':Translate<CR>')
    end
  },
  -- TODO:未設定
  { -- markdown preview
    'kat0h/bufpreview.vim',
    event = 'VeryLazy',
    ft = 'markdown',
    dependencies = {'vim-denops/denops.vim'},
    build = 'deno task prepare',
  },

  { -- mode切り替えを色で判断出来るようにする
    'mvllow/modes.nvim',
    event = "VeryLazy",
    config = function()
      require('modes').setup({
        colors = {
          copy = "#f5c359",
          delete = "#c75c6a",
          insert = "#78ccc5",
          visual = "#9745be",
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.15,
        -- Enable cursor highlights
        set_cursor = false,
        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,
        -- Enable line number highlights to match cursorline
        set_number = false,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
      })
    end
  },

-- =============================================
-- =               Visual
-- =============================================

  { -- colose scheme
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- quickfixの見た目をかっこよくする
  {
    'kevinhwang91/nvim-bqf',
    -- lazy = true,
    ft = 'qf',
    -- TODO:未設定
  },
  -- noiceで代用できそうなので一旦切る
  -- { --検索で何文字進めばいいのかを表示してくれる
  --   'kevinhwang91/nvim-hlslens',
  --   event = 'BufEnter',
  --   config = function()
  --     require('hlslens').setup()
  --     local opts = {noremap = true, silent = true}
  --     -- *TODO*:うまく動作しない
  --     vim.api.nvim_set_keymap('n', 'n',
  --         [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --         opts)
  --     vim.api.nvim_set_keymap('n', 'N',
  --         [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --         opts)
  --     vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
  --     vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
  --     vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
  --     vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
  --     vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':noh<CR>', opts)
  --   end,
  -- },


  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
        require'lualine'.setup {
            options = {
                theme = 'onedark',
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
                colored = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        -- 一文字にする
                        fmt = function(str) return str:sub(1,1) end
                    },
                },
                lualine_b = {
                    {
                        'filetype',
                        icon_only = true,
                    },
                    {
                        'filename',
                        path = 0,
                        file_status = true,
                        symbols = {
                            modified = ' [未保存]',
                            readonly = ' [読み込み専用]',
                            unnamed = '無名ファイル',
                        },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic'},
                        sections = { 'error', 'warn', 'info', 'hint' },

                        diagnostics_color = {
                            Error = "#db4b4b",
                            Warning = "#e0af68",
                            Information = "#0db9d7",
                            Hint = "#10B981"
                        },
                        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                        colored = true,           -- Displays diagnostics status in color if set to true.
                        update_in_insert = false, -- Update diagnostics in insert mode.
                        always_visible = true,   -- Show diagnostics even if there are none.
                    },
                },
                lualine_y = {
                    'branch',
                    'diff',
                },
                lualine_z = {
                    function() return os.date("%F(%A) %H:%M") end,
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_w = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
      }

    end
    -- See `:help lualine.txt`
    -- opts = {
    --   options = {
    --     icons_enabled = false,
    --     theme = 'onedark',
    --     component_separators = '|',
    --     section_separators = '',
    --   },
    -- },
  },

  -- TODO:未設定
  { -- outline表示
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },

  { -- バッファの可視化
    'romgrk/barbar.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    event = 'VeryLazy',
    config = function()
      -- Magic buffer-picking mode
      keymap('n', '<Leader>q',':<C-u>BufferClose!<CR>')

      -- Move to previous/next
      keymap('n', '<Leader>y','<Cmd>BufferPrevious<CR>')
      keymap('n', '<Leader>u','<Cmd>BufferNext<CR>')

      require('barbar').setup
      {
        -- settings
        shadow = true,
        animation = false,
        icons = {
          buffer_number = false,
          buffer_index = false,
        },
        clickable = false,
        semantic_letters = true,
        maximum_padding = 1,
        maximum_length = 30,
        no_name_title = '無名ファイル',
      }
    end
  },
  { -- registerの可視化
    'tversteeg/registers.nvim',
    event = "InsertEnter",
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- TODO:設定したら色々できそう。
  -- 動作が重いので一旦切る
  { -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    -- 'folke/noice.nvim',
    -- dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'},
    -- event = 'VeryLazy',
    -- config = function()
    --   require("noice").setup({})
    -- end
  },

  -- Fuzzy Finder (files, lsp, etc)
  -- extensions(https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'tsakirist/telescope-lazy.nvim',

      -- TODO:後で設定する
      'nvim-telescope/telescope-file-browser.nvim',

      -- TODO:zoxide extensionを入れる
      --TODO: frecency extentionを入れる

      -- FIXME:echoが出来ないとかでエラーが出る
      'nvim-telescope/telescope-ghq.nvim',
    },

    -- [[ Configure Telescope ]]
    config = function()
        local actions = require("telescope.actions")
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
          defaults = {
            mappings = {
              i = {
                -- TODO:<C-j>,<C-k>で選択出来るようにする
                ['<ESC>'] = actions.close
              },
            },
            -- NOTE:履歴ファイルの作成でエラーが出るので一旦消す
            history = false,
             file_ignore_patterns = { --検索対象に含めないファイルを指定
              "^.git/",
              "^node_modules/",
            },
            winblend = 4, --若干ウィンドウを透明に
          },
          extensions = {
            fzf = {
              fuzzy = true,
            },
            lazy = {
              -- Optional theme (the extension doesn't set a default theme)
              -- theme = "ivy",
              -- Whether or not to show the icon in the first column
              show_icon = true,
              -- Mappings for the actions
              mappings = {
                open_in_browser = "<C-o>",
                -- open_in_file_browser = "<M-b>",
                -- open_in_find_files = "<C-f>",
                -- open_in_live_grep = "<C-g>",
                -- open_plugins_picker = "<C-b>", -- Works only after having called first another action
                -- open_lazy_root_find_files = "<C-r>f",
                -- open_lazy_root_live_grep = "<C-r>g",
              },
              -- Other telescope configuration options
            },
          },
        }

        pcall(require('telescope').load_extension, 'ghq')
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'lazy')
        pcall(require("telescope").load_extension "file_browser")

        -- See `:help telescope.builtin`
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sH', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sl', ':<C-u>Telescope lazy<CR>', { desc = '[S]earch [L]azy' })
        vim.keymap.set('n', '<leader>sr', ':<C-u>Telescope ghq list<CR>', { desc = '[S]earch [R]epositories' })
        vim.keymap.set('n', '<leader>sb', ':<C-u>Telescope file_browser hidden=true<CR>', { desc = '[S]earch [F]ile [B]rowser' })
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    event = 'VeryLazy',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    dependencies = {'nvim-telescope/telescope.nvim'},
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    dependencies = {
      -- txstobjects
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 括弧に色を付ける
      'p00f/nvim-ts-rainbow',
      -- 画面に収まらない関数を表示
      'romgrk/nvim-treesitter-context',
      -- 引数に色を付ける
      'm-demare/hlargs.nvim',
    },
    build = ":TSUpdate",
    config = function()
      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
            },
            goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
            },
            goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
            },
            goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
        ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
        ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }

      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
      -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
    end
  },

  {-- ブロックの末尾に何のブロックかを表示する
    -- TODO:helpファイルを読み込んだらエラーが出る
    'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    },
    event = 'VeryLazy',
    config = function()
      require('nvim-biscuits').setup({
        cursor_line_only = true,
        default_config = {
          prefix_string = " -- "
        },
      })
    end
  },

  { -- debbuger settings
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',
      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      -- 'leoluz/nvim-dap-go',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
        },
      }

      -- Basic debugging keymaps, feel free to change to your liking!
      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F1>', dap.step_into)
      vim.keymap.set('n', '<F2>', dap.step_over)
      vim.keymap.set('n', '<F3>', dap.step_out)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end)

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = "⏏",
          },
        },
      }
      -- toggle to see last session result. Without this ,you can't see session output in case of unhandled exception.
      vim.keymap.set("n", "<F7>", dapui.toggle)
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      -- require('dap-go').setup()
    end
  },

  { -- TODOコメントの色を変更
    'folke/todo-comments.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        signs = true, -- show icons in the signs column

        -- keywords recognized as todo comments
        keywords = {
          FIX = {icon = ' ',color = 'error',alt = { 'FIXME', 'BUG', 'FIXIT', 'FIX', 'ISSUE' }},
          TODO = { icon = ' ', color = 'info' },
          HACK = { icon = ' ', color = 'warning' },
          WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
          PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
          NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        },
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          before = 'empty', -- 'fg' or 'bg' or empty
          keyword = 'bg', -- 'fg', 'bg', 'wide' or empty. (wide is the same as bg, but will also highlight surrounding characters)
          after = 'empty', -- 'fg' or 'bg' or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of hilight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { 'LspDiagnosticsDefaultError', 'ErrorMsg', '#DC2626' },
          warning = { 'LspDiagnosticsDefaultWarning', 'WarningMsg', '#FBBF24' },
          info = { 'LspDiagnosticsDefaultInformation', '#2563EB' },
          hint = { 'LspDiagnosticsDefaultHint', '#10B981' },
          default = { 'Identifier', '#7C3AED' },
        },
      }
    end
  },

  -- 選択文字のハイライトをしてくれる
  -- TODO:未設定
  {
    't9md/vim-quickhl',
    event = 'VeryLazy',
  },

  { -- windowのリサイズをおこなう
    'simeji/winresizer',
    event = 'VeryLazy',
  },

  { -- Exコマンドをバッファに書きだしてくれる
    'tyru/capture.vim',
    event = 'VeryLazy',
  },

  -- 日本語ドキュメント
  {
    'vim-jp/vimdoc-ja',
    event = 'BufRead',
    ft = 'help',
  },

  { -- url highlight
    'itchyny/vim-highlighturl',
    event = 'BufRead',
  },
  -- {
  --   'thinca/vim-ambicmd',
  --   config = function()
  --     keymap('c', '<space>', [[ambicmd#expand("\<Space>")]], {expr = true})
  --     keymap('c', '<CR>', [[ambicmd#expand("\<CR>")]], {expr = true})
  --   end,
  -- },
  -- =============================================
  --                Operator
  -- =============================================
  {
    'machakann/vim-sandwich',
    event = 'InsertEnter',
  },
  {
    'machakann/vim-sandwich',
    event = 'InsertEnter',
  },
  {
    'machakann/vim-sandwich',
    event = 'InsertEnter',
  },

  -- =============================================
  --                Language
  -- =============================================

  -- Go lang 関連
  -- interfaceを作成してくれる
  {'mattn/vim-goimpl',ft = 'go',},
  -- Goでimportsとfmtを書き込み時に実行する
  {'mattn/vim-goimports',ft = 'go',},
  -- godoc
  {'mattn/vim-godoc',ft = 'go',},
  -- modファイルのsyntax highlight
  {'mattn/vim-gomod',ft = 'go',},
  -- tagを自動で付けてくれる
  {'mattn/vim-goaddtags',ft = 'go',},
  -- D2
  {'terrastruct/d2-vim',
    event = 'BufReadPre',
    ft = 'd2'
  },
  -- PowerShell
  {'pprovost/vim-ps1',ft = 'ps1'},

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
--   { import = 'custom.plugins' },
}, {})



-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
