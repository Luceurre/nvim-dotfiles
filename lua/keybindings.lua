vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap(
    'n',
    '<Leader>pf',
    [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
    { noremap = true, silent = true }
)
