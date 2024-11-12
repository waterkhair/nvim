-- Plugin for calling lazygit from within neovim
return {
    'kdheepak/lazygit.nvim',
    lazy = true,
    config = function()
        local which_key = require('which-key')

        which_key.add({
            hidden = true,
            { '<leader>gg', ':LazyGit<cr>', desc = 'LazyGit' },
        })
    end,
}
