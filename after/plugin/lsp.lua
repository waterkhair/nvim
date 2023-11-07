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
mason_lspconfig.setup_handlers({
    function(server_name)
        lsp_config[server_name].setup({
            capabilities = lsp_capabilities,
            workspace = { maxPreload = 100000, preloadFileSize = 10000 },
        })
    end
})
lsp_config.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = { diagnostics = { globals = { 'vim' } } },
        capabilities = lsp_capabilities,
        workspace = { maxPreload = 100000, preloadFileSize = 10000 },
    },
})

vim.keymap.set('n', '<leader>mm', ':Mason<CR>', { silent = true })

-- Global mappings. See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>ds', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>ff', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

--[[local whichkey = require('which-key')

whichkey.register({
    m = {
        'Mason',
        m = 'Open Mason',
    },
}, {
    prefix = '<leader>',
})--]]
