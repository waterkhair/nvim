local lsp_config = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local which_key = require('which-key')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- create keybindings here...
    end
})

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

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        which_key.register({
            ['<ctrl-k>'] = { vim.lsp.buf.signature_help, 'Go to signature help' },
            ['<space>'] = {
                a = {
                    'Actions',
                    l = { vim.lsp.buf.code_action, 'List all code action' },
                },
                D = { vim.lsp.buf.type_definition, 'Type definition' },
                F = {
                    'Format',
                    f = { function()
                        vim.lsp.buf.format({ async = true })
                    end, 'Format current buffer' }
                },
                r = {
                    'Rename',
                    a = { vim.lsp.buf.rename, 'Rename current variable' },
                },
                w = {
                    'Workspaces',
                    a = { vim.lsp.buf.add_workspace_folder, 'Add workspace folder' },
                    l = { function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, 'List workspaces' },
                    r = { vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder' },
                },
            },
            g = {
                'Go to',
                D = { vim.lsp.buf.declaration, 'Go to declaration' },
                d = { vim.lsp.buf.definition, 'Go to definition' },
                i = { vim.lsp.buf.implementation, 'Go to implementation' },
                r = { vim.lsp.buf.references, 'Go to references' },
            },
            K = { vim.lsp.buf.hover, 'Hover' },
        }, {
            buffer = ev.buf,
        })
        which_key.register({
            ['<space>'] = {
                c = {
                    'Code',
                    a = { vim.lsp.buf.code_action, 'Code action' },
                },
            },
        }, {
            mode = 'v',
        })
    end,
})
