return {
    'RutaTang/quicknote.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = true,
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
        which_key.add({
            { '<leader>fn', desc = 'Find a Quicknote' },
            { '<leader>fnb', ':Telescope quicknote scope=CurrentBuffer<cr>', desc = 'Find current buffer notes' },
            { '<leader>fng', ':Telescope quicknote scope=Global<cr>', desc = 'Find global notes' },
            { '<leader>fnw', ':Telescope quicknote scope=CWD<cr>', desc = 'Find CWD notes' },
            { '<leader>n', desc = 'Notes' },
            { '<leader>nc', desc = 'Create note' },
            { '<leader>ncg', function() quicknote.NewNoteAtGlobal() end, desc = 'New global note' },
            { '<leader>ncl', function() quicknote.NewNoteAtCurrentLine() quicknote.OpenNoteAtCurrentLine() end, desc = 'New line note' },
            { '<leader>ncw', function() quicknote.NewNoteAtCWD() end, desc = 'New CWD note' },
            { '<leader>nd', desc = 'Delete note' },
            { '<leader>ndg', function() quicknote.DeleteNoteAtGlobal() end, desc = 'Delete global note' },
            { '<leader>ndl', function() quicknote.DeleteNoteAtCurrentLine() end, desc = 'Delete line note' },
            { '<leader>ndw', function() quicknote.DeleteNoteAtCWD() end, desc = 'Delete CWD note' },
            { '<leader>nl', desc = 'List notes' },
            { '<leader>nlb', function() quicknote.ListNotesForCurrentBuffer() end, desc = 'List current buffer notes' },
            { '<leader>nlg', function() quicknote.ListNotesForGlobal() end, desc = 'List global notes' },
            { '<leader>nlw', function() quicknote.ListNotesForCWD() end, desc = 'List CWD notes' },
            { '<leader>no', desc = 'Open note' },
            { '<leader>nog', function() quicknote.OpenNoteAtGlobal() end, desc = 'Open global note' },
            { '<leader>nol', function() quicknote.OpenNoteAtCurrentLine() end, desc = 'Open line note' },
            { '<leader>now', function() quicknote.OpenNoteAtCWD() end, desc = 'Open CWD note' },
            { '<leader>nq', ':Bdelete<cr>::wq<cr>', desc = 'Close note' },
            { '<leader>ns', desc = 'Signs' },
            { '<leader>nsh', function() quicknote.HideNoteSigns() end, desc = 'Hide note signs' },
            { '<leader>nss', function() quicknote.ShowNoteSigns() end, desc = 'Show note signs' },
            { '<leader>nst', function() quicknote.ToggleNoteSigns() end, desc = 'Toggle note signs' },
            { '[n', function() quicknote.JumpToNextNote() end, desc = 'Next note' },
            { ']n', function() quicknote.JumpToPreviousNote() end, desc = 'Previous note' },
        })
    end,
}

