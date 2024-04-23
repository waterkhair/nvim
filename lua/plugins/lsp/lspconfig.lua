-- Configs for the Nvim LSP client
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim', -- Adds vscode-like pictograms to neovim built-in lsp:
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        vim.diagnostic.config({ float = { border = 'rounded' } })

        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local which_key = require('which-key')
        local on_attach = function(_, bufnr)
            which_key.register({
                d = {
                    'Diagnostics',
                    f = { vim.diagnostic.open_float, 'Open float diagnostic' },
                    l = { ':Telescope diagnostics bufnr=0<cr>', 'Show buffer diagnosticsss' },
                    L = { vim.diagnostic.setloclist, 'Open diagnostics list' },
                },
                E = {
                    c = { vim.lsp.buf.code_action, 'See available code actions' },
                    f = { function() vim.lsp.buf.format({ async = true }) end, 'Format file' },
                    r = { vim.lsp.buf.rename, 'Smart rename' },
                },
                W = {
                    'Workspace',
                    a = { vim.lsp.buf.add_workspace_folder, 'Add workspace folder' },
                    l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List workspaces' },
                    r = { vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder' },
                },
            }, {
                buffer = bufnr,
                noremap = true,
                prefix = '<leader>',
                silent = true,
            })
            which_key.register({
                ['<c-k>'] = { vim.lsp.buf.signature_help, 'Go to signature help' },
                ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
                [']d'] = { vim.diagnostic.goto_next, 'Go to next diagnostic' },
                d = {
                    p = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
                    n = { vim.diagnostic.goto_next, 'Go to next diagnostic' },
                },
                F = {
                    r = { ':LspRestart<cr>', 'Restart LSP' },
                },
                g = {
                    r = { ':Telescope lsp_references show_line=false<cr>', 'Go to LSP references' },
                    D = { vim.lsp.buf.declaration, 'Go to declaration' },
                    d = { ':Telescope lsp_definitions<cr>', 'Go to LSP definitions' },
                    i = { ':Telescope lsp_implementations<cr>', 'Go to LSP implementations' },
                    I = { ':LspInfo<cr>', 'Go to LSP information' },
                    t = { ':Telescope lsp_type_definitions<cr>', 'Go to LSP type definitions' },
                },
                K = { vim.lsp.buf.hover, 'Show documentation for what is under cursor' },
            }, {
                buffer = bufnr,
                noremap = true,
                mode = 'n',
                silent = true,
            })
            which_key.register({
                E = {
                    c = { vim.lsp.buf.code_action, 'See available code actions' },
                },
            }, {
                buffer = bufnr,
                noremap = true,
                mode = 'v',
                silent = true,
            })
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

