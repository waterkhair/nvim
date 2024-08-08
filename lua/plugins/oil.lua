return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        local oil = require('oil')

        oil.setup({
            default_file_explorer = false,
            -- keymaps = {
            --     ["g?"] = "actions.show_help",
            --     ["<cr>"] = "actions.select",
            --     ["<C-\\>"] = "actions.select_vsplit",
            --     ["<C-enter>"] = "actions.select_split", -- this is used to navigate left
            --     ["<C-t>"] = "actions.select_tab",
            --     ["<C-p>"] = "actions.preview",
            --     ["<C-c>"] = "actions.close",
            --     ["<C-r>"] = "actions.refresh",
            --     ["-"] = "actions.parent",
            --     ["_"] = "actions.open_cwd",
            --     ["`"] = "actions.cd",
            --     ["~"] = "actions.tcd",
            --     ["gs"] = "actions.change_sort",
            --     ["gx"] = "actions.open_external",
            --     ["g."] = "actions.toggle_hidden",
            -- },
            -- use_defauylt_keymaps = false,
        })

        vim.api.nvim_create_user_command('OilOpenFloat', function() oil.open_float() end, {})
    end,
}
