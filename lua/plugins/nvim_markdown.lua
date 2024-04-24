return {
   'ixru/nvim-markdown',
    lazy = false,
    init = function()
        --vim.g.vim_markdown_frontmatter = 1

        local which_key = require('which-key')

        which_key.register({
            m = {
                'Markdown',
                d = { ':HeaderDecrease<cr>', 'Decrease all headers' },
                i = { ':HeaderIncrease<cr>', 'Increase all headers' },
                s = { ':SetexToAtx<cr>', 'Setex to Atx headers' },
                t = {
                    'Table of contents',
                    h = { ':Toch<cr>', 'Generate table of contents (horizontal)' },
                    i = { ':InsertToc<cr>', 'Insert table of contents at current line' },
                    I = { ':InsertNToc<cr>', 'Insert table of contents at current line (h2)' },
                    t = { ':Toc<cr>', 'Generate table of contents' },
                    v = { ':Tocv<cr>', 'Generate table of contents (vertical)' },
                },
            },
        }, {
            mode = 'n',
            prefix = '<leader>',
        })
    end,
}

