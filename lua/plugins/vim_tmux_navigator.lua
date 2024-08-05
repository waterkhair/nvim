-- Will allow you to navigate seamlessly between vim and tmux splits
return {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
        local which_key = require('which-key')

        which_key.add({
            mode = 'n',
            { '<c-h>', ':TmuxNavigateLeft<cr>', desc = 'Move to left tmux pane' },
            { '<c-j>', ':TmuxNavigateDown<cr>', desc = 'Move to bottom tmux pane' },
            { '<c-k>', ':TmuxNavigateUp<cr>', desc = 'Move to top tmux pane' },
            { '<c-l>', ':TmuxNavigateRight<cr>', desc = 'Move to right tmux pane' },
        })
    end
}

