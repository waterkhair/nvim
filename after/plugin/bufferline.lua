local bufferline = require('bufferline')

vim.opt.termguicolors = true

bufferline.setup({
    options = {
        close_command = 'Bdelete %d',
        right_mouse_command = 'Bdelete %d',
        indicator = { style = '| ' },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "

            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")

                s = s .. n .. sym
            end

            return s
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'center',
                separator = true,
            },
        },
        separator_style = { '|', '|' },
    },
    highlights = {
        offset_separator = { fg = '#48494B', bg = 'none' },
    },
})

vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '[b', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { silent = true })
vim.keymap.set('n', '<leader>bc', ':Bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>bo', ':.+,$bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>ba', ':bufdo :Bdelete<CR>', { silent = true })

--[[local whichkey = require('which-key')

whichkey.register({
    b = {
        'Buffer',
        n = 'Next Buffer',
        p = 'Previous Buffer',
        c = 'Close Curret Buffer',
        o = 'Close All Other Buffers',
        a = 'Close All Buffers',
    },
}, {
    prefix = '<leader>',
})--]]


