-- Displays a popup with possible key bindings
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    configs = {
        icons = {
            group = vim.g.icons_enabled and '' or '+', separator = ""
        },
        disable = {
            filetypes = {
                'TelescopePrompt'
            },
        },
    },
    lazy = true,
}

