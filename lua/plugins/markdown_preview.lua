-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
return {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    config = function()
        -- let g:mkdp_auto_close = 0
        local which_key = require('which-key')

        which_key.register({
            m = {
                'Markdown',
                p = { ':MarkdownPreview<cr>', 'Preview markdown' },
                s = { ':MarkdownPreviewStop<cr>', 'Stop preview' },
                t = { ':MarkdownPreviewToggle<cr>', 'Toggle preview' },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

