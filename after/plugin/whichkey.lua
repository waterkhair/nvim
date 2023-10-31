local whichkey = require('which-key')

whichkey.register({
    l = {
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
    },
}, {
    prefix = '<leader>',
})

