require('catppuccin').setup {
    flavour = 'mocha',
    integrations = { nvimtree = true },
    highlight_overrides = { mocha = function(mocha) return { NvimTreeNormal = { bg = mocha.none } } end },
    transparent_background = true,
}

vim.cmd.colorscheme('catppuccin')

vim.keymap.set('n', '<leader>cc', ':colorscheme catppuccin<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    c = {
        'Color Scheme',
        c = 'Catppuccin',
    },
}, {
    prefix = '<leader>',
})--]]

