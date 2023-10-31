local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'eslint', 'lua_ls' },
  handlers = { lsp_zero.default_setup },
})

-- Set up lspconfig
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
    function (server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
    end
})

lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })

vim.keymap.set('n', '<leader>mm', ':Mason<CR>', { silent = true })

local whichkey = require('which-key')

whichkey.register({
    m = {
        'Mason',
        m = 'Open Mason',
    },
}, {
    prefix = '<leader>',
})

