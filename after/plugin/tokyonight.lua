require('tokyonight').setup({
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    },
})

vim.keymap.set('n', '<leader>ct', ':colorscheme tokyonight<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    c = {
        'Color Scheme',
        r = 'Tokyo Night',
    },
}, {
    prefix = '<leader>',
})--]]

