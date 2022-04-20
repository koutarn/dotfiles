local wezterm = require 'wezterm';

-- key mapping
local default_keys = {
    { key = "n", mods = "SHIFT|CTRL", action = "SpawnWindow"},
	{ key = "n", mods = "ALT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
    { key = "x", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
	{ key = "y", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "u", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
    { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
    { key = "r", mods = "ALT", action = "ReloadConfiguration" },
    { key = "\\", mods = "ALT",action=wezterm.action{SplitHorizontal={domain="DefaultDomain"}}},
    { key = "-", mods = "ALT",action=wezterm.action{SplitVertical={domain="DefaultDomain"}}},
	{ key = "h", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "l", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "k", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "j", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "Enter", mods = "ALT", action = "QuickSelect" },
}

local config = {
    -- default shell
    default_prog = {"powershell.exe", "-nologo"},

    -- color scheme
    color_scheme = "GitHub Dark",

    -- font
    use_ime = true,
    font = wezterm.font_with_fallback({
        "UDEV Gothic 35NFLG",
        "Cica",
        "JetBrains Mono",
    }),
    font_size = 11.0,
    adjust_window_size_when_changing_font_size = false, -- フォントサイズ変更時にウィンドウサイズを変更しないようにする

	window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- 文字選択
    selection_word_boundary = " \t\n{}[]()\"'`,;:",

    -- デフォルトキーを無効化
    disable_default_key_bindings = true,

    -- keyの設定
    keys = default_keys,

    -- タブ
    tab_bar_at_bottom = true,                           -- tabを下に表示
    hide_tab_bar_if_only_one_tab = true,                -- tabが一つなら隠す
}

return config
