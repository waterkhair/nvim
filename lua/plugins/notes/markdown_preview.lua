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
        -- vim.g.mkdp_theme = 'light'

        local which_key = require('which-key')

        which_key.add({
            { '<leader>p', desc = 'Preview', icon = '' },
            { '<leader>ps', ':MarkdownPreview<cr>', desc = 'Preview markdown' },
            { '<leader>px', ':MarkdownPreviewStop<cr>', desc = 'Stop preview' },
            { '<leader>pp', ':MarkdownPreviewToggle<cr>', desc = 'Toggle preview' },
        })
    end,
}

