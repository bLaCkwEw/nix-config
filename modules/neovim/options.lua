-- Set leader to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.clipboard = 'unnamedplus' -- Sync clipboard with system

vim.opt.number = true -- Line numbers

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default (idk what it does)

-- Set tab width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.updatetime = 250 -- How long to wait before swap file is written to disk

-- Decrease mapped sequence wait time to display which-key faster
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.termguicolors = true -- Enable 24-bit RGB color support

vim.opt.mouse = 'a' -- Mouse support for all modes

vim.g.have_nerd_font = true -- Tell nvim you have a nerdfont in the terminal

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true -- Show which line the cursor is on

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

