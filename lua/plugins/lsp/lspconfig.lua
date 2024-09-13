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
            which_key.add({
                buffer = bufnr,
                noremap = true,
                silent = true,
                {
                    { 'd', desc = 'Diagnostics' },
                    { 'df', vim.diagnostic.open_float, desc = 'Open float diagnostic' },
                    { 'dl', ':Telescope diagnostics bufnr=0<cr>', desc = 'Show buffer diagnosticsss' },
                    { 'dL', vim.diagnostic.setloclist, desc = 'Open diagnostics list' },
                },
                {
                    { 'E', desc = 'Edit' },
                    { 'Ec', vim.lsp.buf.code_action, desc = 'See available code actions' },
                    { 'Ef', function() vim.lsp.buf.format({ async = true }) end, desc = 'Format file' },
                    { 'Er', vim.lsp.buf.rename, desc = 'Smart rename' },
                },
                {
                    { 'L', desc = 'LSP' },
                    { '<leader>Lr', ':LspRestart<cr>', desc = 'Restart LSP' },
                },
                {
                    { 'W', desc = 'Workspace' },
                    { 'Wa', vim.lsp.buf.add_workspace_folder, desc = 'Add workspace folder' },
                    { 'Wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = 'List workspaces' },
                    { 'Wr', vim.lsp.buf.remove_workspace_folder, desc = 'Remove workspace folder' },
                },
            })
            which_key.add({
                buffer = bufnr,
                noremap = true,
                mode = 'n',
                silent = true,
                {
                    { 'd', desc = 'Diagnostics' },
                    { 'dp', vim.diagnostic.goto_prev, desc = 'Go to previous diagnostic' },
                    { 'dn', vim.diagnostic.goto_next, desc = 'Go to next diagnostic' },
                },
                {
                    { 'g', desc = 'Go to' },
                    { 'gr', ':Telescope lsp_references show_line=false<cr>', desc = 'Go to LSP references' },
                    { 'gD', vim.lsp.buf.declaration, desc = 'Go to declaration' },
                    { 'gd', ':Telescope lsp_definitions<cr>', desc = 'Go to LSP definitions' },
                    { 'gi', ':Telescope lsp_implementations<cr>', desc = 'Go to LSP implementations' },
                    { 'gI', ':LspInfo<cr>', desc = 'Go to LSP information' },
                    { 'gt', ':Telescope lsp_type_definitions<cr>', desc = 'Go to LSP type definitions' },
                    { 'K', vim.lsp.buf.hover, desc = 'Show documentation for what is under cursor' },
                },
                { '<c-k>', vim.lsp.buf.signature_help, desc = 'Go to signature help' },
                { '[d', vim.diagnostic.goto_prev, desc = 'Go to previous diagnostic' },
                { ']d', vim.diagnostic.goto_next, desc = 'Go to next diagnostic' },
            })
            which_key.add({
                buffer = bufnr,
                noremap = true,
                mode = 'v',
                silent = true,
                {
                    { 'E', desc = 'Edit' },
                    { 'Ec', vim.lsp.buf.code_action, desc = 'See available code actions' },
                },
            })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }

        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type

            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        lspconfig['html'].setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig['ts_ls'].setup({ capabilities = capabilities, on_attach = on_attach })
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

