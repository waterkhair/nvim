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
            -- extensions = {
            --     quicknote = {
            --         defaultScope = 'CurrentBuffer',
            --     },
            -- },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('lazygit')
        -- telescope.load_extension('quicknote')

        which_key.add({
            { '<leader>f', desc = 'Find' },
            { '<leader>fQ', builtin.quickfixhistory, desc = 'Find quickfix history' },
            { '<leader>fb', builtin.buffers, desc = 'Find buffers' },
            { '<leader>fc', builtin.grep_string, desc = 'Find string under cursor in cwd' },
            { '<leader>ff', builtin.find_files, desc = 'Find files' },
            { '<leader>fg', builtin.git_files, desc = 'Find git files' },
            { '<leader>fh', builtin.search_history, desc = 'Search history' },
            { '<leader>fl', builtin.highlights, desc = 'Find highlights' },
            { '<leader>fm', builtin.marks, desc = 'Find marks' },
            { '<leader>fq', builtin.quickfix, desc = 'Find quickfix' },
            { '<leader>fr', builtin.oldfiles, desc = 'Find recent opened files' },
            { '<leader>fs', builtin.live_grep, desc = 'Find string in cwd' },
            { '<leader>fw', builtin.spell_suggest, desc = 'Find word suggestion' },
            { '<leader>fx', builtin.current_buffer_fuzzy_find, desc = 'Find current buffer fuzzy find' },
            -- {
            --     { '<leader>fn', desc = 'Find a Quicknote' },
            --     { '<leader>fnb', ':Telescope quicknote scope=CurrentBuffer<cr>', desc = 'Find current buffer notes' },
            --     { '<leader>fng', ':Telescope quicknote scope=Global<cr>', desc = 'Find global notes' },
            --     { '<leader>fnw', ':Telescope quicknote scope=CWD<cr>', desc = 'Find CWD notes' },
            -- },
        })
    end,
}

