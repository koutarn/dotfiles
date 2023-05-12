require('line-notes').setup({
	path = vim.fn.stdpath('data')..'/line-notes.json', -- path where to save the file
	border_style = 'rounded',
	preview_max_width = 80,
	auto_preview = true,
	icon = '',
	mappings = {
		add = '<leader>aa',
		edit = '<leader>ae',
		preview = '<leader>ap',
		delete = '<leader>ad',
	}
})
