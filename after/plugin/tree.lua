-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<leader>eo', ':NvimTreeOpen<CR>', { silent = true })
    vim.keymap.set('n', '<leader>ec', ':NvimTreeClose<CR>', { silent = true })
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require('nvim-tree').setup({
    on_attach = my_on_attach,
    sort_by = 'case_sensitive',
    view = {
        width = 30,
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
})

local whichkey = require('which-key')

whichkey.register({
    e = {
        'File Explorer',
        o = 'Open File Explorer',
        c = 'Close File Explorer',
    },
}, {
    prefix = '<leader>',
})

