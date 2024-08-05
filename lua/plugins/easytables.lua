return {
    'Myzel394/easytables.nvim',
    lazy = false,
    config = function()
        local easytables = require('easytables')
        local which_key = require('which-key')

        easytables.setup({
            set_mappings = function(buf)
                which_key.add({
                    buffer = buf,
                    mode = 'n',
                    { '<c-h>', ':JumpLeft<cr>', desc = 'Markdown' },
                    { '<c-j>', ':JumpDown<cr>', desc = 'Jump down' },
                    { '<c-k>', ':JumpUp<cr>', desc = 'Jump up' },
                    { '<c-l>', ':JumpRight<cr>', desc = 'Jump right' },
                    { '<s-c>', desc = 'Switch cell/column/row' },
                    { '<s-c>h', ':SwapWithLeftCell<cr>', desc = 'Swap with left cell' },
                    { '<s-c>j', ':SwapWithLowerCell<cr>', desc = 'Swap with lower cell' },
                    { '<s-c>k', ':SwapWithUpperCell<cr>', desc = 'Swap with upper cell' },
                    { '<s-c>l', ':SwapWithRightCell<cr>', desc = 'Swap with right cell' },
                    { '<s-c>H', ':SwapWithLeftColumn<cr>', desc = 'Swap with left column' },
                    { '<s-c>J', ':SwapWithLowerRow<cr>', desc = 'Swap with lower row' },
                    { '<s-c>K', ':SwapWithUpperRow<cr>', desc = 'Swap with upper row' },
                    { '<s-c>L', ':SwapWithRightColumn<cr>', desc = 'Swap with right column' },
                    { '<c-d>', ':DeleteRow<cr>', desc = 'Delete row' },
                    { '<s-d>', ':DeleteColumn<cr>', desc = 'Delete column' },
                    { '<c-b>', ':InsertColumnRight<cr>', desc = 'Add column to right' },
                    { '<c-a>', ':InsertColumnLeft<cr>', desc = 'Add column to left' },
                    { '<s-b>', ':InsertRowBelow<cr>', desc = 'Insert row below' },
                    { '<s-a>', ':InsertRowAbove<cr>', desc = 'Insert row above' },
                    { '<c-t>', ':ToggleHeader<cr>', desc = 'Toggle Header' },
                    { '<c-c>', ':ExportTable<cr>', desc = 'Export table' },
                    { '<esc>', ':ExportTable<cr>', desc = 'Export table' },
                    { '<cr>', ':ExportTable<cr>', desc = 'Export table' },
                })
            end,
        })

        which_key.add({
            { '<leader>m', desc = 'Markdown' },
            { '<leader>me', ':EasyTablesImportThisTable<cr>', desc = 'Edit Table' },
            { '<leader>mn', desc = 'New table' },
            { '<leader>mn1', ':EasyTablesCreateNew 1<cr>', desc = 'Create table 1x1' },
            { '<leader>mn2', ':EasyTablesCreateNew 2<cr>', desc = 'Create table 2x2' },
            { '<leader>mn3', ':EasyTablesCreateNew 3<cr>', desc = 'Create table 3x3' },
            { '<leader>mn4', ':EasyTablesCreateNew 4<cr>', desc = 'Create table 4x4' },
            { '<leader>mn5', ':EasyTablesCreateNew 5<cr>', desc = 'Create table 5x5' },
            { '<leader>mn6', ':EasyTablesCreateNew 6<cr>', desc = 'Create table 6x6' },
            { '<leader>mnt', ':EasyTablesCreateNew ', desc = 'Create table' },
        })
    end,
}

