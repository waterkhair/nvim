local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ts', builtin.grep_string, {})
vim.keymap.set('n', '<leader>td', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>to', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>th', builtin.search_history, {})
vim.keymap.set('n', '<leader>tm', builtin.marks, {})
vim.keymap.set('n', '<leader>tw', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>tl', builtin.highlights, {})
vim.keymap.set('n', '<leader>tc', builtin.current_buffer_fuzzy_find, {})

local whichkey = require('which-key')

whichkey.register({
    t = {
        'Telescope/Tabs',
        f = 'Find File',
        g = 'Find Git File',
        s = 'Search Current Word',
        d = 'Search In Current Directory',
        b = 'Find Buffer',
        o = 'Find Old Files',
        h = 'Search History',
        m = 'Search Marks',
        w = 'Find Suggestions',
        l = 'Highlights',
        c = 'Search Word In Current Buffer',
    },
}, {
    prefix = '<leader>',
})

