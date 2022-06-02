require('onedark').setup  {
    -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    style = 'darker',
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'},

    -- Options are italic, bold, underline, none
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
        TSFunction = {fmt = 'bold'},
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
require('onedark').load()

local function skk()
    local skk_mark = ''
    local is_enabled = vim.fn['skkeleton#is_enabled']()
    if is_enabled == vim.api.nvim_eval('v:true') then
        skk_mark = '🇯🇵'
    end

    return skk_mark
end

local function getPath(str)
    str = string.reverse(str)
    local placenum = string.find(str ,"\\")

    if placenum ~= nil then
        str = string.sub(str ,placenum + 1)
    end
    str = string.reverse(str)
    return '📁 ' .. str
end

-- lualine
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
                    dos = '🖥️',
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
        },
        lualine_x = {
            {
                "filename",
                path = 3,
                fmt = getPath,
                file_status = true,
                symbols = {
                    modified = '',
                    readonly = '',
                    unnamed = 'ファイルが存在しません',
                },
            },
        },
        lualine_y = {
            'branch',
            'diff',
            -- 上手く動かないので一旦保留
            -- {
            --     'diagnostics',
            --     source = {'vim_lsp'},
            --     always_visible = true,
            -- }
        },
        lualine_z = {
            'location',
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
}
