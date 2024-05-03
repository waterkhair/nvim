-- A blazing fast and easy to configure Neovim statusline
return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'AndreM222/copilot-lualine',
    },
    lazy = false,
    config = function()
        require('lualine').setup({
            options = {
                disabled_filetypes = {
                    statusline = { 'NvimTree' },
                    winbar = { 'NvimTree' },
                },
            },
            sections = {
                lualine_a = { { 'filename', path = 1 } },
                lualine_b = { 'progress' },
                lualine_c = {
                    'location',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                    },
                },
                lualine_x = { 'copilot', 'filetype' },
                lualine_y = { 'encoding', 'fileformat' },
                lualine_z = { 'mode' },
            },
            inactive_sections = {
                lualine_a = { { 'filename', path = 1 } },
                lualine_b = { 'progress' },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                    },
                },
                lualine_x = { 'filetype' },
                lualine_y = { 'encoding' },
                lualine_z = { 'fileformat' },
            },
            winbar = {
                lualine_a = { },
                lualine_b = { },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { 'diff' },
                lualine_z = { 'branch' },
            },
            inactive_winbar = {
                lualine_a = { },
                lualine_b = { },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { 'diff' },
                lualine_z = { 'branch' },
            },
        })
    end,
}

