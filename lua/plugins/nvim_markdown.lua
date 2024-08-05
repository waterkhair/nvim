return {
   'ixru/nvim-markdown',
    lazy = false,
    config = function()
        local which_key = require('which-key')

        which_key.add({
            mode = 'n',
            { '<leader>m', desc = 'Markdown' },
            { '<leader>mH', ':HeaderIncrease<cr>', desc = 'Increase all headers' },
            { '<leader>mh', ':HeaderDecrease<cr>', desc = 'Decrease all headers' },
            { '<leader>ms', ':SetexToAtx<cr>', desc = 'Setex to Atx headers' },
            {
                { '<leader>mt', desc = 'Table of contents' },
                { '<leader>mtI', ':InsertNToc<cr>', desc = 'Insert table of contents at current line (h2)' },
                { '<leader>mth', ':Toch<cr>', desc = 'Generate table of contents (horizontal)' },
                { '<leader>mti', ':InsertToc<cr>', desc = 'Insert table of contents at current line' },
                { '<leader>mtt', ':Toc<cr>', desc = 'Generate table of contents' },
                { '<leader>mtv', ':Tocv<cr>', desc = 'Generate table of contents (vertical)' },
            },
        })
    end,
}

