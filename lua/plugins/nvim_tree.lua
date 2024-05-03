-- A File Explorer For Neovim
return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    opts = {
        on_attach = function(bufnr)
            local api = require('nvim-tree.api')
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            vim.keymap.set('n', '[r', '<cmd>:NvimTreeResize -5<cr>', opts('Decrease file explorer width'))
            vim.keymap.set('n', ']r', '<cmd>:NvimTreeResize +5<cr>', opts('Increase file explorer width'))
        end,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = true,
        disable_netrw = true,
        auto_reload_on_write = false,
        select_prompts = true,
        sort_by = 'case_sensitive',
        view = {
            centralize_selection = true,
            debounce_delay = 100,
            number = true,
            relativenumber = true,
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

