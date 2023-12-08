-- A blazing fast and easy to configure Neovim statusline
return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local noice = require('noice')

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
                lualine_x = { 'filetype' },
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
                lualine_a = { { noice.api.status.command.get, cond = noice.api.status.command.has } },
                lualine_b = { },
                lualine_c = { { noice.api.status.search.get, cond = noice.api.status.search.has } },
                lualine_x = { },
                lualine_y = { 'diff' },
                lualine_z = { 'branch' },
            },
            inactive_winbar = {
                -- lualine_a = { 'buffers' },
                lualine_a = { { noice.api.status.command.get, cond = noice.api.status.command.has } },
                lualine_b = { },
                lualine_c = { },
                lualine_x = { },
                lualine_y = { },
                lualine_z = { },
            },
        })
    end,
}

