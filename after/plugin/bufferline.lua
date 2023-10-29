vim.opt.termguicolors = true

require('bufferline').setup({})

vim.keymap.set('n', '<space>bn', ':bnext<CR>')
vim.keymap.set('n', '<space>bp', ':bprevious<CR>')
vim.keymap.set('n', '<space>bc', ':bd %<CR>')

