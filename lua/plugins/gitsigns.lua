-- Super fast git decorations implemented purely in Lua
return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    init = function()
        local which_key = require('which-key')

        require('gitsigns').setup({
            current_line_blame_opts = {
                virt_text_pos = 'right_align',
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                -- Navigations
                which_key.register({
                    [']h'] = { function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, 'Next hunk' },
                    ['[h'] = { function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, 'Previous hunk' },
                }, {
                    buffer = bufnr,
                    expr = true,
                })

                -- Actions
                which_key.register({
                    g = {
                        'Git',
                        s = { gs.stage_hunk, 'Stage hunk' },
                        r = { gs.reset_hunk, 'Reset hunk' },
                        S = { gs.stage_buffer, 'Stage buffer' },
                        u = { gs.undo_stage_hunk, 'Undo stage hunk' },
                        R = { gs.reset_buffer, 'Reset buffer' },
                        p = { gs.preview_hunk, 'Preview hunk' },
                        b = { function() gs.blame_line { full = true } end, 'Blame line' },
                        d = { gs.diffthis, 'Diff this' },
                        D = { function() gs.diffthis('~') end, 'Diff ~' },
                        t = { gs.toggle_current_line_blame, 'Toggle current line blame' },
                        T = { gs.toggle_deleted, 'Toggle deleted' },
                    },
                }, {
                    buffer = bufnr,
                    mode = 'n',
                    prefix = '<leader>',
                })
                which_key.register({
                    s = { function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Stage hunk' },
                    r = { function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Reset hunk' },
                }, {
                    buffer = bufnr,
                    mode = 'v',
                    prefix = '<leader>',
                })

                -- Text object
                which_key.register({
                    ih = { ':<C-U>Gitsigns select_hunk<CR>', 'Stage hunk' },
                }, {
                    buffer = bufnr,
                    mode = { 'o', 'x' },
                })
            end,
        })
    end,
}

