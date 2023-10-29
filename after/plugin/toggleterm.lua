function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }

    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local float = Terminal:new({ hidden = true, direction = 'float' })
local horizontal = Terminal:new({ hidden = true, direction = 'horizontal' })
local vertical = Terminal:new({ hidden = true, direction = 'vertical' })

function _FLOAT_TOGGLE()
    float:toggle()
end

function _HORIZONTAL_TOGGLE()
    horizontal:toggle()
end

function _VERTICAL_TOGGLE()
    vertical:toggle()
end

vim.keymap.set('n', '<leader>tf', '<cmd>lua _FLOAT_TOGGLE()<CR>')
vim.keymap.set('n', '<leader>tt', '<cmd>lua _HORIZONTAL_TOGGLE()<CR>')
vim.keymap.set('n', '<leader>tv', '<cmd>lua _VERTICAL_TOGGLE()<CR>')

