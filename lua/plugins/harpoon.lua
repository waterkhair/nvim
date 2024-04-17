-- Smart and Powerful commenting plugin for neovim
return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        local pickers = require('telescope.pickers')
        local finders = require('telescope.finders')
        local config = require('telescope.config').values
        local which_key = require('which-key')

        local function toggle_telescope(harpoon_files)
            local file_paths = {}

            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            pickers.new({}, {
                prompt_title = 'Harpoon',
                finder = finders.new_table({
                    results = file_paths,
                }),
                previewer = config.file_previewer({}),
                sorter = config.generic_sorter({}),
            }):find()
        end

        harpoon.setup()

        -- Which key mappings
        which_key.register({
            h = {
                'Harpoon',
                a = { function() harpoon:list():add() end, 'Add file' },
                d = { function() harpoon:list():remove() end, 'Remove file' },
                e = { function() toggle_telescope(harpoon:list()) end, 'Toggle quick menu' },
                n = { function() harpoon:list():next() end, 'Go to next file' },
                p = { function() harpoon:list():prev() end, 'Go to previous file' },
                ['1'] = { function() harpoon:list():select(1) end, 'Go to file 1' },
                ['2'] = { function() harpoon:list():select(2) end, 'Go to file 2' },
                ['3'] = { function() harpoon:list():select(3) end, 'Go to file 3' },
                ['4'] = { function() harpoon:list():select(4) end, 'Go to file 4' },
                ['5'] = { function() harpoon:list():select(5) end, 'Go to file 5' },
            },
        }, {
            prefix = '<leader>',
        })
    end,
}

