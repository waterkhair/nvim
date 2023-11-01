vim.opt.termguicolors = true

require('bufferline').setup({
    options = {
        indicator = { style = 'none' },
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
                text_align = 'center',
                separator = false,
            },
        },
        separator_style = { '/', '/' },
    },
})

vim.keymap.set('n', '<leader>>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader><', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bc', ':bd %<CR>:bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bo', ':.+,$bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>ba', ':%bd<CR>', { silent = true })

local whichkey = require('which-key')

whichkey.register({
    ['>'] = 'Next Buffer',
    ['<'] = 'Previous Buffer',
    b = {
        'Buffer',
        p = 'Previous Buffer',
        c = 'Close Curret Buffer',
        o = 'Close All Other Buffers',
        a = 'Close All Buffers',
    },
}, {
    prefix = '<leader>',
})

