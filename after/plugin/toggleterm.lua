require('toggleterm').setup({
    highlights = {
        Normal = { link = 'Normal' },
        NormalNC = { link = 'NormalNC' },
        NormalFloat = { link = 'NormalFloat' },
        FloatBorder = { link = 'FloatBorder' },
        StatusLine = { link = 'StatusLine' },
        StatusLineNC = { link = 'StatusLineNC' },
        WinBar = { link = 'WinBar' },
        WinBarNC = { link = 'WinBarNC' },
    },
    size = function(term)
        if (term.direction == 'horizontal') then return 20
        elseif (term.direction == 'vertical') then return 15 end
    end,
    on_create = function()
        vim.opt.foldcolumn = '0'
        vim.opt.signcolumn = 'no'
    end,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = { border = 'rounded' },
})
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

--[[-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local float = Terminal:new({ hidden = true, direction = 'float' })
local node = Terminal:new({ cmd = 'node', hidden = true, direction = 'float' })

function _FLOAT_TOGGLE() float:toggle() end
function _NODE_TOGGLE() node:toggle() end

vim.keymap.set('n', '<leader>ft', '<cmd>lua _FLOAT_TOGGLE()<CR>')
vim.keymap.set('n', '<leader>nt', '<cmd>lua _NODE_TOGGLE()<CR>')--]]

--[[local whichkey = require('which-key')

whichkey.register({
    ['<c-\\>'] = {
        'Toggle Terminal',
    },
})

whichkey.register({
    f = {
        'ToggleTerm',
        t = 'Open Float Terminal',
    },
    n = {
        'ToggleTerm',
        t = 'Open Node Terminal',
    },
}, {
    prefix = '<leader>',
})--]]

