-- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        local which_key = require('which-key')

        bufferline.setup({
            options = {
                close_command = 'Bdelete %d',
                right_mouse_command = 'Bdelete %d',
                indicator = {
                    style = '| ',
                },
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, _, diagnostics_dict)
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
                separator_style = {
                    '|',
                    '|',
                },
            },
            highlights = {
                offset_separator = {
                    fg = '#48494B',
                    bg = 'none',
                },
            },
        })

        which_key.register({
            b = {
                'Buffers',
                s = {
                    'Sort buffers',
                    d = { ':BufferLineSortByDirectory<cr>', 'Sort buffers by extension' },
                    e = { ':BufferLineSortByExtension<cr>', 'Sort buffers by extension' },
                },
                c = { ':Bdelete<cr>', 'Close curret buffer' },
                o = { ':BufferLineCloseOthers<cr>', 'Close all other buffers' },
                a = { ':bufdo :Bdelete<cr>', 'Close all buffers' },
                l = { ':BufferLineCloseLeft<cr>', 'Close all buffers to the left' },
                r = { ':BufferLineCloseRight<cr>', 'Close all buffers to the right' },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

