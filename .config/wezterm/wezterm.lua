local wezterm = require 'wezterm';

-- key mapping
local default_keys = {
    { key = "n", mods = "SHIFT|CTRL", action = "SpawnWindow"},
    { key = "u", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
    { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
    { key = "r", mods = "ALT", action = "ReloadConfiguration" },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action{CopyTo="ClipboardAndPrimarySelection"} },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action{PasteFrom="Clipboard"} },
    { key = "w", mods = "ALT", action = "QuitApplication" },
    { key = "o", mods = "ALT", action = "QuickSelect" },
    { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },

    -- tab
    { key = "n", mods = "ALT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
    { key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
    { key = "y", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },

    -- pane

    -- 移動
	{ key = "h", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "l", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "k", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "j", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },

    -- サイズ変更
    { key = "h", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "l", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "k", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "j", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5} }) },

    { key = "\\", mods = "ALT",action=wezterm.action{SplitHorizontal={domain="DefaultDomain"}}},
    { key = "-", mods = "ALT",action=wezterm.action{SplitVertical={domain="DefaultDomain"}}},
    { key = "x", mods = "ALT", action = wezterm.action({CloseCurrentPane={confirm=false} }) },

}


local config = {

    -- weztermの更新を確認する
    check_for_updates = true,
    check_for_updates_interval_seconds = 86400, -- 60 *  60 * 24 == 1日

    -- default shell
    default_prog = {"powershell.exe", "-nologo"},

    -- color scheme
    color_scheme = "Dracula+",

    -- font
    use_ime = true,
    font = wezterm.font_with_fallback({
        "UDEV Gothic 35NFLG",
        "Cica",
        "JetBrains Mono",
    }),
    font_size = 11.0,
    adjust_window_size_when_changing_font_size = false, -- フォントサイズ変更時にウィンドウサイズを変更しないようにする
    harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- 合字フォントを無効化

    -- window
	window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- 文字選択
    selection_word_boundary = " \t\n{}[]()\"'`,;:",

    -- カーソルの形
    default_cursor_style = "SteadyBar",

    -- デフォルトキーを無効化
    disable_default_key_bindings = true,

    -- keyの設定
    keys = default_keys,

    -- タブ
    tab_bar_at_bottom = true,                           -- tabを下に表示
    hide_tab_bar_if_only_one_tab = true,                -- tabが一つなら隠す

}

return config
