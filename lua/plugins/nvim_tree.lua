-- A File Explorer For Neovim
return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        on_attach = function(bufnr)
            local api = require('nvim-tree.api')
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end,
        sort_by = 'case_sensitive',
        view = {
            width = 40,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        update_focused_file = {
            enable = true,
        },
    },
}

