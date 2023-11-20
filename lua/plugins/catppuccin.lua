-- Catppuccin for (Neo)vim
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
        flavour = 'mocha',
        integrations = { nvimtree = true },
        highlight_overrides = { mocha = function(mocha) return { NvimTreeNormal = { bg = mocha.none } } end },
        transparent_background = true,
    },
    lazy = true,
}

