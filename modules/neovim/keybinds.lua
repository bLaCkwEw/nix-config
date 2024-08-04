-- Set CTRL+s to write to the file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Terminal
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true })

-- Quit session
vim.keymap.set('n', '<leader>qq', ':q!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>qw', ':wq<CR>', { noremap = true, silent = true })
