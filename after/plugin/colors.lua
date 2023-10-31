vim.cmd.colorscheme('catppuccin')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- Set colors
vim.keymap.set('n', '<leader>cc', ':colorscheme catppuccin<CR>', { silent = true })
vim.keymap.set('n', '<leader>cr', ':colorscheme rose-pine<CR>', { silent = true })

local whichkey = require('which-key')

whichkey.register({
    c = {
        'Color Scheme',
        c = 'Catppuccin',
        r = 'Rose Pine',
    },
}, {
    prefix = '<leader>',
})
