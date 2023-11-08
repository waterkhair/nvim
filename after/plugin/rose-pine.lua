require('rose-pine').setup({
    variant = 'moon',
})

vim.keymap.set('n', '<leader>cr', ':colorscheme rose-pine<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    c = {
        'Color Scheme',
        r = 'Rose Pine',
    },
}, {
    prefix = '<leader>',
})--]]

