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

    { key = "\\", mods = "ALT",action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "-", mods = "ALT",action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "x", mods = "ALT", action = wezterm.action({CloseCurrentPane={confirm=false} }) },

}


local config = {
    -- weztermの更新を確認する
    check_for_updates = false,
    -- check_for_updates_interval_seconds = 86400, -- 60 *  60 * 24 == 1日

    use_ime = true,
    warn_about_missing_glyphs = false,

    -- default shell
    default_prog = {"pwsh.exe", "-nologo"},

    -- color scheme
    color_scheme = "Operator Mono Dark",

    -- weztermのサイズを指定
    initial_rows = 45,
    initial_cols = 120,

    -- font
    font = wezterm.font_with_fallback({
    {family="PlemolJP Console NF", weight="Medium"},
    }),
    font_size = 11,

    adjust_window_size_when_changing_font_size = false, -- フォントサイズ変更時にウィンドウサイズを変更しないようにする
    harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- 合字フォントを無効化

    -- window
	window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    window_background_opacity = 0.9,
    -- window_background_image = 'C:/Users/fusek/img/cyberpunk.jpg',
    -- window_background_image_hsb = {
    --     -- Darken the background image by reducing it to 1/3rd
    --     brightness = 0.3,

    --     -- You can adjust the hue by scaling its value.
    --     -- a multiplier of 1.0 leaves the value unchanged.
    --     hue = 1.0,

    --     -- You can adjust the saturation also.
    --     saturation = 1.0,
    -- },


    -- 文字選択
    selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",

    -- カーソルの形
    default_cursor_style = "SteadyBlock",

    -- デフォルトキーを無効化
    disable_default_key_bindings = true,

    -- keyの設定
    keys = default_keys,

    -- タブ
    tab_bar_at_bottom = true,                           -- tabを下に表示
    hide_tab_bar_if_only_one_tab = false,                -- tabが一つなら隠す

    -- QuickSelectModeの時のパターン
    quick_select_patterns = {
        "[0-9a-zA-Z@.]{7,40}",
    }

}

return config
