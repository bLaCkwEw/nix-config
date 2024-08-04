-- Set CTRL+s to write to the file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Terminal
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true })
