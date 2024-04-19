return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        local which_key = require('which-key')

        which_key.register({
            [':'] = { ':FineCmdline<cr>', 'Command line' },
        })
    end,
}

