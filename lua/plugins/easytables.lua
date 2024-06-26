return {
    'Myzel394/easytables.nvim',
    lazy = false,
    config = function()
        local easytables = require('easytables')
        local which_key = require('which-key')

        easytables.setup({
            set_mappings = function(buf)
                which_key.register({
                    ['<c-h>'] = { ':JumpLeft<cr>', 'Jump left' },
                    ['<c-j>'] = { ':JumpDown<cr>', 'Jump down' },
                    ['<c-k>'] = { ':JumpUp<cr>', 'Jump up' },
                    ['<c-l>'] = { ':JumpRight<cr>', 'Jump right' },
                    ['<s-c>'] = {
                        'Switch cell/column/row',
                        h = { ':SwapWithLeftCell<cr>', 'Swap with left cell' },
                        j = { ':SwapWithLowerCell<cr>', 'Swap with lower cell' },
                        k = { ':SwapWithUpperCell<cr>', 'Swap with upper cell' },
                        l = { ':SwapWithRightCell<cr>', 'Swap with right cell' },
                        H = { ':SwapWithLeftColumn<cr>', 'Swap with left column' },
                        J = { ':SwapWithLowerRow<cr>', 'Swap with lower row' },
                        K = { ':SwapWithUpperRow<cr>', 'Swap with upper row' },
                        L = { ':SwapWithRightColumn<cr>', 'Swap with right column' },
                    },
                    ['<c-d>'] = { ':DeleteRow<cr>', 'Delete row' },
                    ['<s-d>'] = { ':DeleteColumn<cr>', 'Delete column' },
                    ['<c-b>'] = { ':InsertColumnRight<cr>', 'Add column to right' },
                    ['<c-a>'] = { ':InsertColumnLeft<cr>', 'Add column to left' },
                    ['<s-b>'] = { ':InsertRowBelow<cr>', 'Insert row below' },
                    ['<s-a>'] = { ':InsertRowAbove<cr>', 'Insert row above' },
                    ['<c-t>'] = { ':ToggleHeader<cr>', 'Toggle Header' },
                    ['<c-c>'] = { ':ExportTable<cr>', 'Export table' },
                    ['<esc>'] = { ':ExportTable<cr>', 'Export table' },
                    ['<cr>'] = { ':ExportTable<cr>', 'Export table' },
                }, {
                    buffer = buf,
                    mode = 'n',
                })
            end,
        })

        which_key.register({
            m = {
                'Markdown',
                e = { ':EasyTablesImportThisTable<cr>', 'Edit Table' },
                n = {
                    'New table',
                    ['1'] = {':EasyTablesCreateNew 1<cr>', 'Create table 1x1' },
                    ['2'] = {':EasyTablesCreateNew 2<cr>', 'Create table 2x2' },
                    ['3'] = {':EasyTablesCreateNew 3<cr>', 'Create table 3x3' },
                    ['4'] = {':EasyTablesCreateNew 4<cr>', 'Create table 4x4' },
                    ['5'] = {':EasyTablesCreateNew 5<cr>', 'Create table 5x5' },
                    ['6'] = {':EasyTablesCreateNew 6<cr>', 'Create table 6x6' },
                    t = {':EasyTablesCreateNew ', 'Create table' },
                },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

