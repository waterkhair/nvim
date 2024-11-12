-- Catppuccin for (Neo)vim
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    config = function()
        local catppuccin = require('catppuccin')

        catppuccin.setup({
            flavour = 'mocha',
            transparent_background = true,
        })
    end,
}

