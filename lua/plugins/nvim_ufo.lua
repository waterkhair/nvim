-- Makes Neovim's fold look modern and keep high performance
return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
    },
    event = 'VeryLazy',
    run = ':TSUpdate',
    config = function()
        local ufo = require('ufo')

        ufo.setup({
            provider_selector = function()
                return { 'treesitter', 'indent' }
            end,
        })

        vim.api.nvim_create_user_command('UfoCloseAllFolds', function() ufo.closeAllFolds() end, {})
        vim.api.nvim_create_user_command('UfoOpenAllFolds', function() ufo.openAllFolds() end, {})
    end,
}

