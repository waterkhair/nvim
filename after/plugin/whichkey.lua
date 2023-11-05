local which_key = require('which-key')

 which_key.setup({
    icons = { group = vim.g.icons_enabled and '' or '+', separator = "" },
    disable = { filetypes = { 'TelescopePrompt' } },
})

which_key.register({
    --[[l = {
        'Lazy',
        l = 'Open Lazy',
    },
    r = {
        'Replace',
        c = 'Replace Current Word',
    },
    t = {
        'Telescope/Tabs',
        n = 'New Empty Tab',
        o = 'Close All Other Tabs',
    },
    s = {
        'Split Screen',
        h = 'Split Horiztonal Screen',
        v = 'Split Vertical Screen',
    },--]]
}, {
    prefix = '<leader>',
})

