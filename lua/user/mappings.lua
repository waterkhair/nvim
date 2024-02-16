local ufo = require('ufo')
local which_key = require('which-key')

-- Which key mappings
which_key.register({
    b = {
        'Buffers',
        a = { ':bufdo :Bdelete<cr>', 'Close all buffers' },
        c = { ':Bdelete<cr>', 'Close current buffer' },
        C = { ':Bdelete!<cr>', 'Force close current buffer' },
        e = { ':enew<cr>', 'Ediot new buffer' },
        l = { ':BufferLineCloseLeft<cr>', 'Close all buffers to the left' },
        n = { ':bn<cr>', 'Next buffer' },
        o = { ':BufferLineCloseOthers<cr>', 'Close all other buffers' },
        p = { ':bp<cr>', 'Next buffer' },
        r = { ':BufferLineCloseRight<cr>', 'Close all buffers to the right' },
    },
    c = { 'Code actions' },
    d = {
        'Diagnostics',
        S = { vim.diagnostic.open_float, 'Open floag diagnostic' },
        L = { vim.diagnostic.setloclist, 'Open diagnostics list' },
    },
    e = {
        'File explorer',
        c = { ':NvimTreeClose<cr>', 'Close file explorer' },
        o = { ':NvimTreeOpen<cr>', 'Open file explorer' },
    },
    g = {
        'Git',
        g = { ':LazyGit<cr>', 'Open LazyGit' },
    },
    i = {
        'Indent',
        b = { ':GuessIndent<cr>', 'Indent buffer' },
    },
    l = {
        'Lazy',
        l = { ':Lazy<cr>', 'Lazy' },
    },
    m = {
        'Mason',
        m = { ':Mason<cr>', 'Open mason' },
    },
    p = {
        'Paint',
        c = { ':colorscheme catppuccin<cr>', 'Catppuccin' },
        t = { ':colorscheme tokyonight<cr>', 'Tokyo Night' },
        r = { ':colorscheme rose-pine<cr>', 'Rose Pine' },
    },
    P = { '"*p', 'Paste from clipbord' },
    q = {
        'Quit',
        a = { ':qa<cr>', 'Quit all' },
        c = { ':cq<cr>', 'Quit without saving' },
        e = { ':x<cr>', 'Write and quit (if modified)' },
        h = { ':noh<cr>', 'Quit highlights' },
        q = { ':q<cr>', 'Quit' },
        Q = { ':q!<cr>', 'Force quit' },
        w = { ':wq<cr>', 'Write and quit' },
        W = { ':wq!<cr>', 'Force write and quit' },
    },
    r = { 'Rename' },
    R = {
        'Replace',
        c = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', 'Replace all occurrences of current word' },
    },
    s = {
        'File',
        o = { ':so<cr>', 'Source file' },
        s = { ':w<cr>', 'Save file' },
        S = { ':w!<cr>', 'Force save file' },
    },
    t = {
        'Tabs',
        ['1'] = { '1gt', 'Go to tab 1' },
        ['2'] = { '2gt', 'Go to tab 2' },
        ['3'] = { '3gt', 'Go to tab 3' },
        ['4'] = { '4gt', 'Go to tab 4' },
        ['5'] = { '5gt', 'Go to tab 5' },
        c = { ':tabclose<cr>', 'Close current tab' },
        e = { ':tabedit<cr>', 'Edit new tab' },
        f = { ':tabfirst<cr>', 'Go to first tab' },
        l = { ':tablast<cr>', 'Go to last tab' },
        n = { ':tabnew<cr>', 'New tab' },
        o = { ':tabonly<cr>', 'Close all other tabs' },
        s = { ':tabs<cr>', 'List all tabs' },
        T = { '<c-w>T', 'Open buffer new tab' },
    },
    u = {
        'Undotree',
        t = { vim.cmd.UndotreeToggle, 'Open UndotreeTogle' },
    },
    w = { 'Workspace' },
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
    ['<c-h>'] = { ':TmuxNavigateLeft<cr>', 'Move to left tmux pane' },
    ['<c-j>'] = { ':TmuxNavigateDown<cr>', 'Move to bottom tmux pane' },
    ['<c-k>'] = { ':TmuxNavigateUp<cr>', 'Move to top tmux pane' },
    ['<c-l>'] = { ':TmuxNavigateRight<cr>', 'Move to right tmux pane' },
    ['<Tab>'] = { ':BufferLineCycleNext<cr>', 'Next buffer' },
    ['<S-Tab>'] = { ':BufferLineCyclePrev<cr>', 'Previous buffer' },
    ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
    [']d'] = { vim.diagnostic.goto_next, 'Go to previous diagnostic' },
    ['[b'] = { ':BufferLineCyclePrev<cr>', 'Previous buffer' },
    [']b'] = { ':BufferLineCycleNext<cr>', 'Next buffer' },
    ['[B'] = { ':BufferLineMovePrev<cr>', 'Move buffer to the left' },
    [']B'] = { ':BufferLineMoveNext<cr>', 'Move buffer to the right' },
    ['[q'] = { ':cp<cr>', 'Previous quickfix item' },
    [']q'] = { ':cn<cr>', 'Next quickfix item' },
    ['[t'] = { ':tabn<cr>', 'Go to next tab' },
    [']t'] = { ':tabp<cr>', 'Go to previous tab' },
    J = { 'mzJ`z', 'Append next line to current line' },
    N = { 'Nzzzv', 'Search next but keep cursor centered' },
    n = { 'nzzzv', 'Search previous but keep cursor centered' },
})
which_key.register({
    K = {':m \'<-2<CR>gv=gv', 'Move selected line down' },
    J = {':m \'>+1<CR>gv=gv', 'Move selected line up' },
    P = { '"*p', 'Paste from clipbord' },
    Y = { '"*y', 'Yank to clipbord' },
}, {
    mode = 'v',
})
which_key.register({
    ['<c-\\>'] = { '<c-\\><c-n>:FTermToggle<cr>', 'Toggle terminal' }
}, {
    mode = 't'
})

