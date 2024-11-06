return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        local oil = require('oil')

        oil.setup({
            default_file_explorer = true,
            columns = {
                -- "mtime",
                -- "permissions",
                -- "size",
                "icon",
            },
            win_options = {
                signcolumn = "yes",
            },
            delete_to_trash = true,
            float = {
                preview_split = "right",
            },
            -- keymaps = {
            --     ["g?"] = "actions.show_help",
            --     ["<CR>"] = "actions.select",
            --     ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
            --     ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
            --     ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
            --     ["<C-p>"] = "actions.preview",
            --     ["<C-c>"] = "actions.close",
            --     ["<C-l>"] = "actions.refresh",
            --     ["-"] = "actions.parent",
            --     ["_"] = "actions.open_cwd",
            --     ["`"] = "actions.cd",
            --     ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
            --     ["gs"] = "actions.change_sort",
            --     ["gx"] = "actions.open_external",
            --     ["g."] = "actions.toggle_hidden",
            --     ["g\\"] = "actions.toggle_trash",
            -- },
            -- use_defauylt_keymaps = false,
        })

        vim.api.nvim_create_user_command('OilOpenFloat', function() oil.open_float() end, {})
    end,
}
