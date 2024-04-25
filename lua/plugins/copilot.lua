-- Uses OpenAI Codex to suggest code and entire functions in real-time right from your editor
return {
    'github/copilot.vim',
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true

        local which_key = require('which-key')

        which_key.register({
            c = {
                'Copilot',
                d = { ':Copilot disable<cr>', 'Disable Copilot' },
                e = { ':Copilot enable<cr>', 'Enable Copilot' },
                f = { ':Copilot feedback<cr>', 'Send feedback to Copilot' },
                o = { ':Copilot signout<cr>', 'Sign out of Copilot' },
                p = { ':Copilot panel<cr>', 'Open Copilot panel' },
                s = { ':Copilot setup<cr>', 'Setup Copilot' },
                v = { ':Copilot version<cr>', 'Show Copilot version' },
            },
        }, {
            prefix = '<leader>',
        })
        which_key.register({
            ['<c-d>'] = { '<Plug>(copilot-dismiss)', 'Dismiss suggestion' },
            ['<c-j>'] = { '<Plug>(copilot-next)', 'Next suggestion' },
            ['<c-k>'] = { '<Plug>(copilot-previous)', 'Previous suggestion' },
            ['<c-l>'] = { '<Plug>(copilot-accept-line)', 'Accept next line suggestion' },
            ['<c-y>'] = { function() vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 'i', true) end, 'Accept next word suggestion' },
            ['<c-w>'] = { '<Plug>(copilot-accept-word)', 'Accept next word suggestion' },
        }, {
            mode = 'i',
        })
    end,
}

