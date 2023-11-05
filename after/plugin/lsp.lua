local lsp_config = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- create keybindings here...
    end
})

mason.setup({})
mason_lspconfig.setup({ ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'html', 'cssls' } })
mason_lspconfig.setup_handlers({ function (server_name) lsp_config[server_name].setup({ capabilities = lsp_capabilities }) end })
lsp_config.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = { diagnostics = { globals = { 'vim' } } },
        workspace = { maxPreload = 100000, preloadFileSize = 10000 },
    },
})

vim.keymap.set('n', '<leader>mm', ':Mason<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    m = {
        'Mason',
        m = 'Open Mason',
    },
}, {
    prefix = '<leader>',
})--]]

