-- don't use default plugins
local default_plugins = {
  did_install_default_menus = 1,
  did_install_syntax_menu   = 1,
  did_indent_on             = 1,
  -- did_load_filetypes        = 1,
  -- did_load_ftplugin         = 1,
  loaded_2html_plugin       = 1,
  loaded_gzip               = 1,
  loaded_man                = 1,
  loaded_matchit            = 1,
  loaded_matchparen         = 1,
  loaded_netrwPlugin        = 1,
  loaded_remote_plugins     = 1,
  loaded_shada_plugin       = 1,
  loaded_spellfile_plugin   = 1,
  loaded_tarPlugin          = 1,
  loaded_tutor_mode_plugin  = 1,
  loaded_zipPlugin          = 1,
  skip_loading_mswin        = 1,
}

for k,v in pairs(default_plugins) do
  vim.g[k] = v
end

-- basic option settings
require('options')

-- basic keymp settings
require('keymaps')

-- plugin settings(load and configuration)
require('plugins')













-- vim: ts=2 sts=2 sw=2 et
