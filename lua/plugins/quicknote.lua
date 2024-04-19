return {
    'RutaTang/quicknote.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        local quicknote = require('quicknote')
        local which_key = require('which-key')

        quicknote.setup({
            mode = 'resident',
            sign = 'N',
            filetype = 'md',
            git_branch_recognizable = true,
        })

        -- Which key mappings
        which_key.register({
            n = {
                'Notes',
                c = {
                    'Create note',
                    l = { function() quicknote.NewNoteAtCurrentLine()  quicknote.OpenNoteAtCurrentLine() end, 'New line note' },
                    g = { function() quicknote.NewNoteAtGlobal() end, 'New global note' },
                    w = { function() quicknote.NewNoteAtCWD() end, 'New CWD note' },
                },
                d = {
                    'Delete note',
                    l = { function() quicknote.DeleteNoteAtCurrentLine() end, 'Delete line note' },
                },
                l = {
                    'List notes',
                    b = { function() quicknote.ListNotesForCurrentBuffer() end, 'List current buffer notes' },
                    g = { function() quicknote.ListNotesForGlobal() end, 'List global notes' },
                    w = { function() quicknote.ListNotesForCWD() end, 'List CWD notes' },
                },
                o = {
                    'Open note',
                    l = { function() quicknote.OpenNoteAtCurrentLine() end, 'Open line note' },
                    g = { function() quicknote.OpenNoteAtGlobal() end, 'Open global note' },
                    w = { function() quicknote.OpenNoteAtCWD() end, 'Open CWD note' },
                },
                q = { ':Bdelete<cr>::wq<cr>', 'Close note' },
                s = {
                    'Signs',
                    h = { function() quicknote.HideNoteSigns() end, 'Hide note signs' },
                    s = { function() quicknote.ShowNoteSigns() end, 'Show note signs' },
                    t = { function() quicknote.ToggleNoteSigns() end, 'Toggle note signs' },
                },
            },
            f = {
                n = {
                    'Find a Quicknote',
                    b = { ':Telescope quicknote [scope=CurrentBuffer]<cr>', 'Find current buffer notes' },
                    g = { ':Telescope quicknote [scope=Global]<cr>', 'Find global notes' },
                    w = { ':Telescope quicknote [scope=CWD]<cr>', 'Find CWD notes' },
                },
            },
        }, {
            prefix = '<leader>',
        })
        which_key.register({
            ['['] = {
                n = { function() quicknote.JumpToNextNote() end, 'Next note' },
            },
            [']'] = {
                n = { function() quicknote.JumpToPreviousNote() end, 'Previous note' },
            },
        })
    end,
}

