local ddu = {
    patch_global = vim.fn['ddu#custom#patch_global'];
    alias = vim.fn['ddu#custom#alias'];
    do_action = vim.fn['ddu#ui#ff#do_action'];
}

-- alias
ddu.alias('source', 'ghq', 'file_external')
ddu.alias('source', 'zoxide', 'file_external')
ddu.alias('source', 'current_files', 'file_external')
ddu.alias('source', 'current_directorys', 'file_external')
ddu.alias('source', 'memolist', 'file_external')

local lines = vim.o.lines / 3

ddu.patch_global({
    ui = 'ff',
    sync = false,
    sources = {
        {
            name = 'file_rec',
            params = {
                ignoredDirectories = {'.svn','.git', 'node_modules', 'vendor', '.next'}
            },
        },
        {name = 'file'},
        {name = 'buffer'},
        {name = 'help'},
        {name = 'source'},
        {name = 'external'},
        {name = 'colorscheme'},
    },
    sourceParams = {
        ghq = {
            cmd = {'ghq', 'list', '-p'},
        },
        current_files = {
            cmd = {'fd', '.', '-H','--type','file','--type','symlink','-E','*git'}
        },
        current_directorys = {
            cmd = {'fd', '.', '-H','--type','directory','--type','symlink','-E','*git'}
        },
        zoxide = {
            cmd = {'zoxide', 'query', '--list'}
        },
        memolist = {
            cmd = { 'fd','*','~/memo/*', '-H', '-t'}
        },
        rg = {
            args = {'--hidden','--ignore-case','--column', '--no-heading','--color', 'never'}
        },
    },
    sourceOptions = {
        ['_'] = {
            ignoreCase = true,
            matchers = {
                'matcher_fzf',
            },
            maxItems = 20000,
        },
        file = {
            matchers = {
                'matcher_fzf', 'matcher_relative', 'matcher_hidden',
            },
        },
        file_rec = {
            matchers = {
                'matcher_fzf', 'matcher_relative', 'matcher_hidden',
            },
        },
        file_point = {
            matchers = {
                'matcher_fzf', 'matcher_relative', 'matcher_hidden',
            },
        },
    },
    kindOptions = {
        file = {
            defaultAction = 'open',
        },
        source = {
            defaultAction = 'execute',
        },
        colorscheme = {
            defaultAction = 'set',
        },
    },
    uiParams = {
        ff = {
            filterSplitDirection = 'floating',
            filterFloatingPosition = 'bottom',
            displaySourceName = 'long',
            startFilter = true,
            floatingBorder = 'none',
            previewFloating = false,
            previewHeight = 30,
            prompt = '> ',
            winHeight = lines,
        },
        filer = {
            split = 'no'
        }
    },
    filterParams = {
        matcher_fzf = {
            highlightMatched = 'Constant',
        }
    }
})

local function ddu_ff_enter()
    local bufopts = { noremap = true, silent = true, buffer = 0 }

    -- ディレクトリ検索ならファイルを開くのではなくcdにする
    if vim.fn.expand('%:t') == 'ddu-ff-cd' then
        vim.keymap.set('n', 'o', function() return ddu.do_action('itemAction',{name =  'cd'}) end, bufopts)
        vim.keymap.set('n', '<CR>', function() return ddu.do_action('itemAction',{name =  'cd'}) end, bufopts)
    else
        -- vim.keymap.set('n', '<CR>', function() return ddu.do_action('chooseAction') end, bufopts)
        vim.keymap.set('n', 'o', function() return ddu.do_action('itemAction',{name =  'open'}) end, bufopts)
        vim.keymap.set('n', '<CR>', function() return ddu.do_action('itemAction',{name =  'open'}) end, bufopts)
    end
    vim.keymap.set('n', 'i', function() return ddu.do_action('openFilterWindow') end, bufopts)
    vim.keymap.set('n', '/', function() return ddu.do_action('openFilterWindow') end, bufopts)
    vim.keymap.set('n', 'p', function() return ddu.do_action('preview') end, bufopts)
    vim.keymap.set('n', 'c', function() return ddu.do_action('itemAction',{name = 'cd'}) end, bufopts)
    vim.keymap.set('n', 'd', function() return ddu.do_action('itemAction', { name = 'delete' }) end, bufopts)
    vim.keymap.set('n', '<Esc>', function() return ddu.do_action('quit') end, bufopts)
    vim.keymap.set('n', 'q', function() return ddu.do_action('quit') end, bufopts)
end

local function ddu_ff_filter_enter()
    local bufopts = { noremap = true, silent = true, buffer = 0 }
    vim.keymap.set('i', '<CR>', '<Esc><Cmd>call ddu#ui#ff#close()<CR>', bufopts)
    vim.keymap.set('i', '<Space>', '<Esc><Cmd>call ddu#ui#ff#close()<CR>', bufopts)
    vim.keymap.set('i', '<ESC>',function() return vim.fn['ddu#ui#ff#close']() and ddu.do_action('quit') end, bufopts)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'ddu-ff' },
    callback = function() ddu_ff_enter() end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'ddu-ff-filter' },
    callback = function() ddu_ff_filter_enter() end,
})

-- file
vim.keymap.set('n', [[<Leader>;;]], [[<Cmd>Ddu -name=files current_files -sync <CR>]], bufopts)
vim.keymap.set('n', [[<Leader>;']], '<Cmd>Ddu -name=files mr<CR>', bufopts)
vim.keymap.set('n', '<Leader>;m', '<Cmd>Ddu -name=files memolist<CR>', bufopts)
vim.keymap.set('n', '<Leader>;j', '<Cmd>Ddu -name=files buffer<CR>', bufopts)

-- directory
vim.keymap.set('n', '<Leader>;p', '<Cmd>Ddu -name=cd ghq<CR>', bufopts)
vim.keymap.set('n', '<Leader>;[', '<Cmd>Ddu -name=cd zoxide<CR>', bufopts)
vim.keymap.set('n', '<Leader>;l', '<Cmd>Ddu -name=cd current_directorys<CR>', bufopts)

-- line
vim.keymap.set('n', '<Leader>;g', [[<Cmd>Ddu -name=line rg -ui-param-ignoreEmpty -source-param-input=`input('Pattern:')`<CR>]], bufopts)
vim.keymap.set('n', '<Leader>/a', '<Cmd>Ddu -name=line line -ui-param-startFilter<CR>', bufopts)
vim.keymap.set('n', '<Leader>;h', '<Cmd>Ddu -name=other help<CR>', bufopts)

-- filer
vim.keymap.set('n','<Leader>f;','<Cmd>Ddu -name=filer-`win_getid()` -ui=filer -source-option-columns=icon_filename file<CR>',bufopts)

vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
        local lines = vim.o.lines / 3

        vim.fn['ddu#custom#patch_global']('uiParams', {
        ff = {
            winHeight = lines,
        }
    })
    end
})
