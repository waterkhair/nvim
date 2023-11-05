require('telescope').load_extension('lazygit')

vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    g = {
        'LazyGit',
        g = 'Open LazyGit',
    },
}, {
    prefix = '<leader>',
})--]]

