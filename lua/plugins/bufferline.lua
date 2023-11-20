-- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            close_command = 'Bdelete %d',
            right_mouse_command = 'Bdelete %d',
            indicator = {
                style = '| ',
            },
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
    },
}

