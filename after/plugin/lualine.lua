local noice = require('noice')

require('lualine').setup({
    sections = {
        lualine_x = {
            {
                noice.api.status.command.get,
                cond = noice.api.status.command.has,
            },
            'encoding',
            'fileformat',
            'filetype',
        },
    },
    winbar = {
        lualine_y = {
            {
                noice.api.status.search.get,
                cond = noice.api.status.search.has,
                color = {
                    fg = '#ff9e64',
                },
            },
        },
    },
    inactive_winbar = {
        lualine_b = {
            {
                noice.api.status.search.get,
                cond = noice.api.status.search.has,
                color = {
                    fg = '#ff9e64',
                },
            },
        },
    },
})

