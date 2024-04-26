-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
return {
    'iamcco/markdown-preview.nvim',
    lazy = true,
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    config = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_combine_preview = 1
        vim.g.mkdp_refresh_slow = 1
        vim.g.mkdp_theme = 'light'

        local which_key = require('which-key')

        which_key.register({
            m = {
                'Markdown',
                P = { ':MarkdownPreview<cr>', 'Preview markdown' },
                S = { ':MarkdownPreviewStop<cr>', 'Stop preview' },
                T = { ':MarkdownPreviewToggle<cr>', 'Toggle preview' },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

