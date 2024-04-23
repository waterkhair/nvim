-- Portable package manager for Neovim that runs everywhere Neovim runs
return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' }, -- Bridges mason.nvim with the lspconfig plugin
    lazy = false,
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'html',
                'tsserver',
                'cssls',
                'tailwindcss',
                'emmet_ls',
                'eslint',
                'lua_ls',
            },
            automatic_installation = true,
        })
    end
}

