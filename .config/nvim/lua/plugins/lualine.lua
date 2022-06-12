require("nvim-gps").setup()

local gps = require("nvim-gps")

local function skk()
    local skk_mark = ''
    local is_enabled = vim.fn['skkeleton#is_enabled']()
    if is_enabled == vim.api.nvim_eval('v:true') then
        skk_mark = '🇯🇵'
    end

    return skk_mark
end

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
            skk,    -- skk入力の時は絵文字する
        },
        lualine_b = {
            'encoding',
            {
            'fileformat',
            symbols = {
                    unix = '🐧',
                    dos = '🐕',
                    mac = '🍎',
                }
            },
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
        },
        lualine_c = {
            {
                gps.get_location,
                cond = gps.is_available,
            },
        },
        lualine_x = {
            function() return '📁 ' .. vim.fn.expand("%:p:h") end,
        },
        lualine_y = {
            'branch',
            'diff',
            -- 'location',
            -- 'progress',
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
