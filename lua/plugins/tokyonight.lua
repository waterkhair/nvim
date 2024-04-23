-- A dark and light Neovim theme written in Lua.
return {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    config = function()
        local tokyonight = require('tokyonight')

        tokyonight.setup({
            transparent = true,
            styles = {
                sidebars = 'transparent',
                floats = 'transparent',
            },
        })
    end,
}

