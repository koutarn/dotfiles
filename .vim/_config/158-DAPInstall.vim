UsePlugin 'DAPInstall.nvim'
"==================================
"Pocco81/DAPInstall.nvim
"==================================

lua << EOF
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = "~/dap_install/",
	verbosely_call_debuggers = true,
})

-- dap_install.config("ccppr_lldb_dbg", {})
EOF
