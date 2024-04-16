-- -- 通常時の括弧補完
-- vim.g.lexima_enable_basic_rules = 1

-- -- 括弧の中で改行を入れた際の補完
-- vim.g.lexima_enable_newline_rules = 0

-- -- 対応するものを入れる補完
-- vim.g.lexima_enable_endwise_rules = 0

-- vim.g.lexima_no_default_rules = 0
vim.g.lexima_enable_newline_rules = 1

local add_rule = vim.fn["lexima#add_rule"]

-- 無名関数
add_rule({
    char =  '>',
    at =  [[([a-zA-Z, ]*\%#)]],
    leave =  ')',
    input =  ' => {',
    input_after =  '}'
})

-- markdown
add_rule({ char = "*", at = [[^\s*\%#]], input = "*<Space>", filetype = "markdown" }) -- Bulleted lists
add_rule({ char = "-", at = [[^\s*\%#]], input = "-<Space>", filetype = "markdown" }) -- Bulleted lists

add_rule({
	char = "]",
	at = [=[\[[^]]*\%#\]]=],
	except = [=[\[@[^]]*\%#\]]=],
	leave = "]",
	input = "(",
	input_after = ")",
	filetype = "markdown",
}) -- Links
