local oil = require('oil')
local ufo = require('ufo')
local which_key = require('which-key')

-- Which key mappings
which_key.register({
    C = {
        'Close',
        e = { ':NvimTreeClose<cr>', 'File explorer' },
        h = { ':noh<cr>', 'Highlights' },
        u = { ':UndotreeHide', 'Undotree' },
    },
    E = {
        'Edit',
        a = { 'ggVG', 'Select all' },
        i = { ':GuessIndent<cr>', 'Indent file' },
        f = { ufo.closeAllFolds, 'Fold all' },
        p = { '"*p', 'Paste from clipbord' },
        y = { '"*y', 'Yank to clipbord' },
        u = { ufo.openAllFolds, 'Unfold all' },
    },
    F = {
        'File',
        c = { ':q<cr>', 'Close' },
        C = { ':q!<cr>', 'Close (Force)' },
        e = { ':qa<cr>', 'Exit' },
        E = { ':qa!<cr>', 'Exit (Force)' },
        o = { ':so<cr>', 'Source' },
        s = { ':w<cr>', 'Save' },
        S = { ':w!<cr>', 'Force save' },
        x = { ':x<cr>', 'Save and close (if modified)' },
    },
    O = {
        'Open',
        e = { ':NvimTreeOpen<cr>', 'File explorer' },
        g = { ':LazyGit<cr>', 'LazyGit' },
        f = { ':OilOpenFloat<cr>', 'File (Oil)' },
        l = { ':Lazy<cr>', 'Lazy' },
        m = { ':ObsidianOpenMarkdownFiles<cr>', 'Markdown files' },
        M = { ':Mason<cr>', 'Mason' },
        o = { ':ObsidianOpenFiles<cr>', 'Obsidian files' },
        t = { ':FTermOpen<cr>', 'Terminal' },
        u = { ':UndotreeShow', 'Undotree' },
        w = { ':WhichKey<cr>', 'Which Key' },
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
        T = { '<c-w>T', 'Open buffer in a new tab' },
    },
}, {
    mode = 'n',
    prefix = '<leader>',
})
which_key.register({
    qq = { ':q<cr>', 'Close' },
    qQ = { ':q!<cr>', 'Close (Force)' },
}, {
    mode = 'n',
    silent = true,
    prefix = '<leader>',
})
which_key.register({
    ['<c-d>'] = { '<C-d>zz', 'Move half page down but keep cursor centered' },
    ['<c-u>'] = { '<C-u>zz', 'Move half page up but keep cursor centered' },
    ['[q'] = { ':cp<cr>', 'Previous quickfix item' },
    [']q'] = { ':cn<cr>', 'Next quickfix item' },
    ['[t'] = { ':tabn<cr>', 'Go to next tab' },
    [']t'] = { ':tabp<cr>', 'Go to previous tab' },
    J = { 'mzJ`z', 'Append next line to current line' },
    N = { 'Nzzzv', 'Search next but keep cursor centered' },
    n = { 'nzzzv', 'Search previous but keep cursor centered' },
}, {
    mode = 'n',
})
which_key.register({
    K = { ':m \'<-2<CR>gv=gv', 'Move selected line down' },
    J = { ':m \'>+1<CR>gv=gv', 'Move selected line up' },
    P = { '"*p', 'Paste from clipbord' },
    Y = { '"*y', 'Yank to clipbord' },
}, {
    mode = 'v',
})

