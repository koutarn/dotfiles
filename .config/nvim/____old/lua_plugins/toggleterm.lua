require("toggleterm").setup {
    open_mapping = [[<Leader>ft]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    height = vim.o.lines / 3,
}
