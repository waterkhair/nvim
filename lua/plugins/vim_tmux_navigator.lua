-- Will allow you to navigate seamlessly between vim and tmux splits
return {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
        local which_key = require('which-key')

        which_key.register({
            ['<c-h>'] = { ':TmuxNavigateLeft<cr>', 'Move to left tmux pane' },
            ['<c-j>'] = { ':TmuxNavigateDown<cr>', 'Move to bottom tmux pane' },
            ['<c-k>'] = { ':TmuxNavigateUp<cr>', 'Move to top tmux pane' },
            ['<c-l>'] = { ':TmuxNavigateRight<cr>', 'Move to right tmux pane' },
        }, {
            mode = 'n',
        })
    end
}

