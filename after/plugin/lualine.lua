local noice = require('noice')

require('lualine').setup({
    options = {
        disabled_filetypes = {
            statusline = { 'NvimTree' },
            winbar = { 'NvimTree' },
        },
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            'filename',
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
            },
        },
        lualine_c = {
            'location',
            { noice.api.status.search.get, cond = noice.api.status.search.has, color = { fg = '#ff9e64' } }
        },
        lualine_x = {
            { noice.api.status.command.get, cond = noice.api.status.command.has },
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'datetime' },
    },
    inactive_sections = {
        lualine_a = { 'mode' },
        lualine_c = { 'windows', 'tabs', 'buffers', { 'filename', path = 1 } },
    },
    winbar = {
        lualine_b = { 'location' },
        lualine_y = { { 'filename', path = 1 } },
    },
})

