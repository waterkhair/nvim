-- Smart and Powerful commenting plugin for neovim
return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    lazy = true,
    init = function()
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
        which_key.add({
            { '<leader>h', desc = 'Harpoon' },
            { '<leader>h1', function() harpoon:list():select(1) end, desc = 'Go to file 1' },
            { '<leader>h3', function() harpoon:list():select(2) end, desc = 'Go to file 3' },
            { '<leader>h2', function() harpoon:list():select(3) end, desc = 'Go to file 2' },
            { '<leader>h4', function() harpoon:list():select(4) end, desc = 'Go to file 4' },
            { '<leader>h5', function() harpoon:list():select(5) end, desc = 'Go to file 5' },
            { '<leader>ha', function() harpoon:list():add() end, desc = 'Add file' },
            { '<leader>hd', function() harpoon:list():remove() end, desc = 'Remove file' },
            { '<leader>he', function() toggle_telescope(harpoon:list()) end, desc = 'Toggle quick menu' },
            { '<leader>hn', function() harpoon:list():next() end, desc = 'Go to next file' },
            { '<leader>hp', function() harpoon:list():prev() end, desc = 'Go to previous file' },
        })
    end,
}

