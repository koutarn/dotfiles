UsePlugin 'todo-comments.nvim'
"==================================
"folka/todo-comments.nvim
"==================================
lua << EOF
require('todo-comments').setup {
  signs = true, -- show icons in the signs column
  -- keywords recognized as todo comments
  keywords = {
    FIX = {icon = ' ',color = 'error',alt = { 'FIXME', 'BUG', 'FIXIT', 'FIX', 'ISSUE' }},
    TODO = { icon = ' ', color = 'info' },
    HACK = { icon = ' ', color = 'warning' },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
    PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
  },
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = 'fg', -- 'fg' or 'bg' or empty
    keyword = 'bg', -- 'fg', 'bg', 'wide' or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = 'fg', -- 'fg' or 'bg' or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { 'LspDiagnosticsDefaultError', 'ErrorMsg', '#DC2626' },
    warning = { 'LspDiagnosticsDefaultWarning', 'WarningMsg', '#FBBF24' },
    info = { 'LspDiagnosticsDefaultInformation', '#2563EB' },
    hint = { 'LspDiagnosticsDefaultHint', '#10B981' },
    default = { 'Identifier', '#7C3AED' },
  },
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
EOF
