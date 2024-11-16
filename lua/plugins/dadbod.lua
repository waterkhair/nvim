-- Allows simple navigation through databases and allows saving queries for later use.
return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1

        local which_key = require('which-key')

        which_key.add({
            { '<leader>bb', ':DBUIToggle<cr>', desc = 'Dadbod' },
        })
    end,
}
