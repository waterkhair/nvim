return {
    'VonHeikemen/searchbox.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    lazy = true,
    config = function()
        local searchbox = require('searchbox')
        local which_key = require('which-key')

        searchbox.setup({
            defaults = {
                show_matches = true,
            },
            popup = {
                position = {
                    row = '3%',
                    col = '50%',
                },
            },
        })

        which_key.register({
            ['/'] = { ':SearchBoxMatchAll<cr>', 'Search' },
        })
        which_key.register({
            ['/'] = { ':SearchBoxMatchAll visual_mode=true<cr>', 'Search' },
        }, {
            mode = 'v',
        })
    end,
}

