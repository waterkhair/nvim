-- Makes Neovim's fold look modern and keep high performance
return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
    },
    opts = {
        provider_selector = function()
            return { 'treesitter', 'indent' }
        end
    },
    run = ':TSUpdate',
}

