require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,  -- syntax highlightを有効にする
    },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 300,
    },

    yati = { enable = true },

	textobjects = {
        select = {
	        enable = true,
	        disable = {},
	        keymaps = {
		        ["af"] = "@function.outer",
		        ["if"] = "@function.inner",
		        ["ac"] = "@class.outer",
		        ["ic"] = "@class.inner",
		        ["iB"] = "@block.inner",
		        ["aB"] = "@block.outer",
		        ["ii"] = "@conditional.inner",
		        ["ai"] = "@conditional.outer",
		        ["il"] = "@loop.inner",
		        ["al"] = "@loop.outer",
		        ["ip"] = "@parameter.inner",
		        ["ap"] = "@parameter.outer",
		        -- ["iS"] = "@scopename.inner",
		        -- ["aS"] = "@statement.outer",
	        },
        },
        swap = {
	        enable = true,
	        swap_next = { ["'>"] = "@parameter.inner" },
	        swap_previous = { ["'<"] = "@parameter.inner" },
        },
        move = {
	        enable = true,
	        goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
	        goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
	        goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
	        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
        },
    },
textsubjects = {
enable = false,
-- prev_selection = "Q",
keymaps = {
	["."] = "textsubjects-smart",
	["<Tab>"] = "textsubjects-container-outer",
	["<S-Tab>"] = "textsubjects-container-inner",
    },
},

}
require 'nvim-treesitter.install'.compilers = { "gcc","clang"}
