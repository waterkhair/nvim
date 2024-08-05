-- No-nonsense floating terminal plugin for neovim
return {
    'numToStr/FTerm.nvim',
    lazy = true,
    init = function()
        local which_key = require('which-key')

        vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
        vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
        vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
        vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

        which_key.add({
            mode = 'n',
            { '<c-\\>', ':FTermToggle<cr>', desc = 'Toggle terminal' },
        })
        which_key.add({
            mode = 't',
            { '<c-\\>', '<c-\\><c-n>:FTermToggle<cr>', desc = 'Toggle terminal' },
        })
    end,
}

