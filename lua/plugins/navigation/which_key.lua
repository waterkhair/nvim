-- Displays a popup with possible key bindings
return {
    'folke/which-key.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    lazy = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local which_key = require('which-key')

        which_key.setup({
            icons = {
                group = vim.g.icons_enabled and '' or '+', separator = ""
            },
            disable = {
                filetypes = {
                    'TelescopePrompt'
                },
            },
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            },
        })
    end,
}

