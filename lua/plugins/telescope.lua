-- Highly extendable fuzzy finder over lists
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons'
    },
    lazy = true,
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local which_key = require('which-key')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-q>'] = actions.smart_send_to_qflist,
                    },
                },
            },
            extensions = {
                quicknote = {
                    defaultScope = 'CurrentBuffer',
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('lazygit')
        telescope.load_extension('quicknote')

        which_key.register({
            f = {
                'Find',
                f = { builtin.find_files, 'Find files' },
                c = { builtin.grep_string, 'Find string under cursor in cwd' },
                s = { builtin.live_grep, 'Find string in cwd' },
                g = { builtin.git_files, 'Find git files' },
                b = { builtin.buffers, 'Find buffers' },
                q = { builtin.quickfix, 'Find quickfix' },
                Q = { builtin.quickfixhistory, 'Find quickfix history' },
                r = { builtin.oldfiles, 'Find recent opened files' },
                h = { builtin.search_history, 'Search history' },
                m = { builtin.marks, 'Find marks' },
                w = { builtin.spell_suggest, 'Find word suggestion' },
                l = { builtin.highlights, 'Find highlights' },
                x = { builtin.current_buffer_fuzzy_find, 'Find current buffer fuzzy find' },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

