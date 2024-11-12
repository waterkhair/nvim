-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    config = function()
        local rose_pine = require('rose-pine')

        rose_pine.setup({
            variant = 'moon',
        })
    end,
}

