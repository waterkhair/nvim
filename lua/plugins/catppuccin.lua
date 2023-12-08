-- Catppuccin for (Neo)vim
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        local catppuccin = require('catppuccin')

        catppuccin.setup({
            flavour = 'mocha',
            integrations = { nvimtree = true },
            highlight_overrides = { mocha = function(mocha) return { NvimTreeNormal = { bg = mocha.none } } end },
            transparent_background = true,
        })
    end,
    lazy = true,
}

