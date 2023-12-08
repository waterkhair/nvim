-- Configs for the Nvim LSP client
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        vim.diagnostic.config({ float = { border = 'rounded' } })

        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = 'Show LSP references'
            keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

            opts.desc = 'Go to declaration'
            keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

            opts.desc = 'Show LSP definitions'
            keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

            opts.desc = 'Show LSP implementations'
            keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

            opts.desc = 'Show LSP type definitions'
            keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

            opts.desc = 'See available code actions'
            keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- in visual mode will apply to selection

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            opts.desc = 'Show buffer diagnostics'
            keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

            opts.desc = 'Show line diagnostics'
            keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)

            opts.desc = 'Go to previous diagnostic'
            keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            keymap.set('n', 'dp', vim.diagnostic.goto_prev, opts)

            opts.desc = 'Go to next diagnostic'
            keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            keymap.set('n', 'dn', vim.diagnostic.goto_next, opts)

            opts.desc = 'Go to signature help'
            keymap.set('n', '<leader>c-k', vim.lsp.buf.signature_help, opts)

            opts.desc = 'Show documentation for what is under cursor'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            opts.desc = 'LSP information'
            keymap.set('n', '<leader>di', ':LspInfo<CR>', opts)

            opts.desc = 'Format current file'
            keymap.set('n', '<leader>sf', function() vim.lsp.buf.format({ async = true }) end, opts)

            opts.desc = 'Add workspace folder'
            keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)

            opts.desc = 'List workspaces'
            keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

            opts.desc = 'Remove workspace folder'
            keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }

        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type

            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        lspconfig['html'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['tsserver'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['cssls'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['tailwindcss'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['emmet_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        })
        lspconfig['eslint'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        })
        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                },
            },
        })
    end,
}

