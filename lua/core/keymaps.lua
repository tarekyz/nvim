local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable space in normal/visual mode (since it's leader)
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Better escape
keymap('i', '<C-c>', '<Esc>', opts)

-- Better line navigation with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Window resizing
keymap('n', '<A-k>', '<C-w>-', opts)
keymap('n', '<A-j>', '<C-w>+', opts)
keymap('n', '<A-h>', '<C-w><', opts)
keymap('n', '<A-l>', '<C-w>>', opts)

-- Arrow key window resizing
keymap('n', '<Up>', ':resize +2<CR>', opts)
keymap('n', '<Down>', ':resize -2<CR>', opts)
keymap('n', '<Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Insert mode navigation
keymap('i', '<C-h>', '<Left>', opts)
keymap('i', '<C-j>', '<Down>', opts)
keymap('i', '<C-k>', '<Up>', opts)
keymap('i', '<C-l>', '<Right>', opts)

-- Move text up/down
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('i', '<C-A-k>', '<esc>:m .-2<CR>==i', opts)
keymap('i', '<C-A-j>', '<esc>:m .+1<CR>==i', opts)
keymap('n', '<leader>k', '<esc>:m .-2<CR>==', opts)
keymap('n', '<leader>j', '<esc>:m .+1<CR>==', opts)

-- Save file
keymap('n', '<C-s>', '<cmd>w<CR>', opts)

-- Reload buffer
keymap('n', '<leader>r', ':e<CR>', opts)

-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
keymap('n', '<leader>sdl', vim.diagnostic.open_float, opts)

