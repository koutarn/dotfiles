UsePlugin 'AbbrevMan.nvim'
"==================================
"Pocco81/AbbrevMan.nvim
"==================================
lua << EOF
local abbrev_man = require("abbrev-man")

abbrev_man.setup({
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = false,
	natural_dictionaries = {
		["nt_path"] = {
		  [";home"] = "~/"
        }
    },
})
EOF
