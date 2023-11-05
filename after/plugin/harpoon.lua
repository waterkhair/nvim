local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end)

--[[local whichkey = require('which-key')

whichkey.register({
    h = {
        'Harpoon',
        a = 'Add File',
        e = 'Toggle Quick Menu',
        ['1'] = 'Go To File 1',
        ['2'] = 'Go To File 2',
        ['3'] = 'Go To File 3',
        ['4'] = 'Go To File 4',
        ['5'] = 'Go To File 5',
    },
}, {
    prefix = '<leader>',
})--]]

