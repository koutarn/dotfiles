-- require("nvim-autopairs").setup {
--     disable_in_macro = true,
--     map_cr = false ,
-- }

-- local rule = require('nvim-autopairs.rule')
-- local pair = require('nvim-autopairs')
-- local cond = require('nvim-autopairs.conds')

-- local get_closing_for_line = function (line)
--   local i = -1
--   local clo = ''

--   while true do
--     i, _= string.find(line, "[%(%)%{%}%[%]]", i + 1)
--     if i == nil then break end
--     local ch = string.sub(line, i, i)
--     local st = string.sub(clo, 1, 1)

--     p = {}

--     if ch == '{' then
--       clo = '}' .. clo
--     elseif ch == '}' then
--       if st ~= '}' then return '' end
--       clo = string.sub(clo, 2)
--     elseif ch == '(' then
--       clo = ')' .. clo
--     elseif ch == ')' then
--       if st ~= ')' then return '' end
--       clo = string.sub(clo, 2)
--     elseif ch == '[' then
--       clo = ']' .. clo
--     elseif ch == ']' then
--       if st ~= ']' then return '' end
--       clo = string.sub(clo, 2)
--     end
--   end

--   return clo
-- end

-- pair.remove_rule('(')
-- pair.remove_rule('{')
-- pair.remove_rule('[')

-- pair.add_rule(
--   rule("[%(%{%[]", "")
--   :use_regex(true)
--   :replace_endpair(function(opts)
--     return get_closing_for_line(opts.line)
--   end)
--   :end_wise()
-- )

