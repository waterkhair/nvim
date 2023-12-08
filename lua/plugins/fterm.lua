-- No-nonsense floating terminal plugin for neovim
return {
    'numToStr/FTerm.nvim',
    config = function()
        vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
        vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
        vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
        vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
    end,
    lazy = true,
}

