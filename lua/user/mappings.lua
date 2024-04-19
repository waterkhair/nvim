local oil = require('oil')
local ufo = require('ufo')
local which_key = require('which-key')

-- Which key mappings
which_key.register({
    E = {
        'Edit',
        i = { ':GuessIndent<cr>', 'Indent file' },
        p = { '"*p', 'Paste from clipbord' },
        y = { '"*y', 'Yank to clipbord' },
        z = { ufo.openAllFolds, 'Unfold all' },
        Z = { ufo.closeAllFolds, 'Fold all' },
    },
    F = {
        'File',
        c = { ':wq<cr>', 'Save and close' },
        C = { ':wq!<cr>', 'Force save and close' },
        o = { ':so<cr>', 'Source' },
        q = { ':q<cr>', 'Quit' },
        s = { ':w<cr>', 'Save' },
        S = { ':w!<cr>', 'Force save' },
        x = { ':x<cr>', 'Save and close (if modified)' },
    },
    O = {
        'Open',
        e = { ':NvimTreeOpen<cr>', 'File explorer' },
        g = { ':LazyGit<cr>', 'LazyGit' },
        h = { ':noh<cr>', 'Highlights' },
        l = { ':Lazy<cr>', 'Lazy' },
        m = { ':Mason<cr>', 'Mason' },
        o = { function() oil.open_float() end, 'Oil' },
        t = { ':FTermOpen<cr>', 'Terminal' },
        u = { ':UndotreeShow', 'UndotreeTogle' },
    },
    Q = {
        'Q',
        e = { ':NvimTreeClose<cr>', 'File explorer' },
        E = { ':cq<cr>', 'Exit' },
        n = { ':qa<cr>', 'Quit Nvim' },
        N = { ':qa!<cr>', 'Force Quit Nvim' },
        u = { ':UndotreeHide', 'UndotreeTogle' },
    },
    S = {
        'Settings',
        t = {
            'Theme',
            c = { ':colorscheme catppuccin<cr>', 'Catppuccin' },
            t = { ':colorscheme tokyonight<cr>', 'Tokyo Night' },
            r = { ':colorscheme rose-pine<cr>', 'Rose Pine' },
        },
    },
    T = {
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
    W = { 'Workspace' },
    d = {
        'Diagnostics',
        S = { vim.diagnostic.open_float, 'Open floag diagnostic' },
        L = { vim.diagnostic.setloclist, 'Open diagnostics list' },
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
    ['<c-\\>'] = { '<c-\\><c-n>:FTermToggle<cr>', 'Toggle terminal' },
}, {
    mode = 't'
})

