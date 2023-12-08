-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
        local rose_pine = require('rose-pine')

        rose_pine.setup({
            variant = 'moon',
        })
    end,
    lazy = true,
}

