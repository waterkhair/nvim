local builtin = require('telescope.builtin')
local mark = require('harpoon.mark')
local noice_lsp = require('noice.lsp')
local ufo = require('ufo')
local ui = require('harpoon.ui')
local which_key = require('which-key')

-- Leader key = space
vim.g.mapleader = ' '

-- Which key mappings
which_key.register({
    b = {
        'Buffers',
        s = {
            'Sort buffers',
            d = { ':BufferLineSortByDirectory<cr>', 'Sort buffers by extension' },
            e = { ':BufferLineSortByExtension<cr>', 'Sort buffers by extension' },
        },
        c = { ':Bdelete<cr>', 'Close curret buffer' },
        o = { ':BufferLineCloseOthers<cr>', 'Close all other buffers' },
        a = { ':bufdo :Bdelete<cr>', 'Close all buffers' },
        l = { ':BufferLineCloseLeft<cr>', 'Close all buffers to the left' },
        r = { ':BufferLineCloseRight<cr>', 'Close all buffers to the right' },
    },
    d = {
        'Diagnostics',
        s = { vim.diagnostic.open_float, 'Open floag diagnostic' },
        l = { vim.diagnostic.setloclist, 'Open diagnostics list' },
    },
    e = {
        'File explorer',
        c = { ':NvimTreeClose<cr>', 'Close file explorer' },
        o = { ':NvimTreeOpen<cr>', 'Open file explorer' },
    },
    f = {
        'Find',
        f = { builtin.find_files, 'Find files' },
        g = { builtin.git_files, 'Find git files' },
        s = { builtin.grep_string, 'Find string' },
        d = { builtin.live_grep, 'Search text' },
        b = { builtin.buffers, 'Find buffers' },
        o = { builtin.oldfiles, 'Find old files' },
        h = { builtin.search_history, 'Search history' },
        m = { builtin.marks, 'Find marks' },
        w = { builtin.spell_suggest, 'Search suggestion' },
        l = { builtin.highlights, 'Search highlights' },
        c = { builtin.current_buffer_fuzzy_find, 'Search current buffer fuzzy find' },
    },
    g = {
        'Git',
        g = { ':LazyGit<cr>', 'Open LazyGit' },
    },
    h = {
        'Harpoon',
        a = { mark.add_file, 'Add file' },
        e = { ui.toggle_quick_menu, 'Toggle quick menu' },
        ['1'] = { function() ui.nav_file(1) end, 'Go to file 1' },
        ['2'] = { function() ui.nav_file(2) end, 'Go to file 2' },
        ['3'] = { function() ui.nav_file(3) end, 'Go to file 3' },
        ['4'] = { function() ui.nav_file(4) end, 'Go to file 4' },
        ['5'] = { function() ui.nav_file(5) end, 'Go to file 5' },
    },
    l = {
        'Lazy',
        l = { ':Lazy<cr>', 'Lazy' },
    },
    m = {
        'Mason',
        m = { ':Mason<cr>', 'Open mason' },
    },
    R = {
        'Replace',
        c = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', 'Replace all occurrences of current word' },
    },
    s = {
        'File',
        o = { ':so', 'Source file' },
        s = { ':w', 'Save file' },
        S = { ':w!', 'Force save file' },
    },
    t = {
        'Tabs/Themes',
        c = { ':colorscheme catppuccin<cr>', 'Catppuccin' },
        -- n = { ':tabedit<cr>', 'Edit new tab' },
        -- o = { '<c-w>T', '<c-w>T' },
        r = { ':colorscheme rose-pine<cr>', 'Rose Pine' },
        t = { ':colorscheme tokyonight<cr>', 'Tokyo Night' },
    },
    u = {
        'Undotree',
        t = { vim.cmd.UndotreeToggle, 'Open UndotreeTogle' },
    },
    z = {
        'Folding',
        R = { ufo.openAllFolds, 'Open all folds' },
        M = { ufo.closeAllFolds, 'Close all folds' },
    },
}, {
    prefix = '<leader>',
})
which_key.register({
    ['<c-\\>'] = { ':FTermToggle<cr>', 'Toggle terminal' },
    ['<c-d>'] = { '<C-d>zz', 'Move half page down but keep cursor centered' },
    ['<c-u>'] = { '<C-u>zz', 'Move half page up but keep cursor centered' },
    ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
    [']d'] = { vim.diagnostic.goto_next, 'Go to previous diagnostic' },
    ['[b'] = { ':BufferLineCyclePrev<cr>', 'Previous buffer' },
    [']b'] = { ':BufferLineCycleNext<cr>', 'Next buffer' },
    [']B'] = { ':BufferLineMoveNext<cr>', 'Move buffer to the right' },
    ['[B'] = { ':BufferLineMovePrev<cr>', 'Move buffer to the left' },
    J = { 'mzJ`z', 'Append next line to current line' },
    N = { 'Nzzzv', 'Search next but keep cursor centered' },
    n = { 'nzzzv', 'Search previous but keep cursor centered' },
})
which_key.register({
    ['<c-f>'] = { function()
        if not noice_lsp.scroll(4) then
            return "<c-f>"
        end
    end, 'Scroll down' },
    ['<c-b>'] = { function()
        if not noice_lsp.scroll(-4) then
            return "<c-b>"
        end
    end, 'Scroll up' },
}, {
    expr = true,
})
which_key.register({
    K = {':m \'<-2<CR>gv=gv', 'Move selected line down' },
    J = {':m \'>+1<CR>gv=gv', 'Move selected line up' },
}, {
    mode = 'v',
})
which_key.register({
    ['<c-\\>'] = { '<c-\\><c-n>:FTermToggle<cr>', 'Toggle terminal' }
}, {
    mode = 't'
})

