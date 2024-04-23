-- Catppuccin for (Neo)vim
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    config = function()
        local catppuccin = require('catppuccin')

        catppuccin.setup({
            flavour = 'mocha',
            integrations = { nvimtree = true },
            highlight_overrides = { mocha = function(mocha) return { NvimTreeNormal = { bg = mocha.none } } end },
            transparent_background = true,
        })
    end,
}

