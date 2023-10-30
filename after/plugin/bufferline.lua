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

vim.keymap.set('n', '<space>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<space>bp', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<space>bc', ':bd %<CR>', { silent = true })
vim.keymap.set('n', '<space>ba', ':bd all<CR>', { silent = true })
vim.keymap.set('n', '<space>bo', ':bd other<CR>', { silent = true })
vim.keymap.set('n', '<space>bm', ':bd menu<CR>', { silent = true })


