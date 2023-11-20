-- A blazing fast and easy to configure Neovim statusline
return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        options = {
            disabled_filetypes = {
                statusline = {
                    'NvimTree',
                },
                winbar = {
                    'NvimTree',
                },
            },
        },
        sections = {
            lualine_a = {
                'mode',
            },
            lualine_b = {
                'branch',
                'diff',
                'filename',
                {
                    'diagnostics',
                    sources = {
                        'nvim_lsp',
                    },
                    sections = {
                        'error',
                        'warn',
                        'info',
                        'hint',
                    },
                },
            },
            lualine_c = {
                'location',
            },
            lualine_y = {
                'progress',
            },
            lualine_z = {
                'datetime',
            },
        },
        inactive_sections = {
            lualine_a = {
                'mode',
            },
            lualine_b = { },
            lualine_c = { },
            lualine_x = { },
            lualine_y = { },
            lualine_z = {
                'datetime',
            },
        },
        winbar = {
            lualine_b = {
                {
                    'filename',
                    path = 1,
                },
            },
        },
        inactive_winbar = {
            lualine_y = {
                {
                    'filename',
                    path = 1,
                },
            },
        },
    },
    lazy = true,
}

