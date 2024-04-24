return {
    'Myzel394/easytables.nvim',
    lazy = false,
    config = function()
        local easytables = require('easytables')
        local which_key = require('which-key')

        easytables.setup({})

        which_key.register({
            m = {
                'Markdown',
                t = {
                    'Tables',
                    e = { ':EasyTablesimportThisTable<cr>', 'Edit Table' },
                    n = {
                        'New table',
                        ['1'] = {':EasyTablesCreateNew 1<cr>', 'Create table 1x1' },
                        ['2'] = {':EasyTablesCreateNew 2<cr>', 'Create table 2x2' },
                        ['3'] = {':EasyTablesCreateNew 3<cr>', 'Create table 3x3' },
                        ['4'] = {':EasyTablesCreateNew 4<cr>', 'Create table 4x4' },
                        ['5'] = {':EasyTablesCreateNew 5<cr>', 'Create table 5x5' },
                        ['6'] = {':EasyTablesCreateNew 6<cr>', 'Create table 6x6' },
                    },
                },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

