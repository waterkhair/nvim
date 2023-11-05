-- Leader key = space
vim.g.mapleader = ' '

-- Move selected line in view mode up/down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Move below line to the end of current line adding a space but without moving the cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- Move half-page down/up without moving the cursor from the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search will keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Replace current word everywhere in the file
vim.keymap.set('n', '<leader>rc', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabedit<CR>', { silent = true })
vim.keymap.set('n', '<leader>to', '<C-w>T')

-- Split window
vim.keymap.set('n', '<leader>sh', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', { silent = true })

