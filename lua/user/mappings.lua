local ufo = require('ufo')
local which_key = require('which-key')

-- Which key mappings
which_key.add({
    mode = 'n',
    {
        { '<leader>Ftj', ':set filetype=json<cr>', desc = 'Set filetype to JSON' },
        { '<leader>Ftm', ':set filetype=markdown<cr>', desc = 'Set filetype to Markdown' },
        { '<leader>Ftp', ':set filetype=python<cr>', desc = 'Set filetype to Python' },
        { '<leader>Ftq', ':set filetype=sql<cr>', desc = 'Set filetype to SQL' },
        { '<leader>Fts', ':set filetype=sh<cr>', desc = 'Set filetype to shell' },
        { '<leader>Ftt', ':set filetype=typescript<cr>', desc = 'Set filetype to TypeScript' },
    },
    {
        { '<leader>t1', '1gt', desc = 'Go to tab 1' },
        { '<leader>t2', '2gt', desc = 'Go to tab 2' },
        { '<leader>t3', '3gt', desc = 'Go to tab 3' },
        { '<leader>t4', '4gt', desc = 'Go to tab 4' },
        { '<leader>t5', '5gt', desc = 'Go to tab 5' },
        { '<leader>tt', '<c-w>T', desc = 'Open buffer in a new tab' },
        { '<leader>tc', ':tabclose<cr>', desc = 'Close current tab' },
        { '<leader>te', ':tabedit<cr>', desc = 'Edit new tab' },
        { '<leader>tf', ':tabfirst<cr>', desc = 'Go to first tab' },
        { '<leader>tl', ':tablast<cr>', desc = 'Go to last tab' },
        { '<leader>tn', ':tabnext<cr>', desc = 'Next tab' },
        { '<leader>tp', ':tabprev<cr>', desc = 'Previous tab' },
        { '<leader>to', ':tabonly<cr>', desc = 'Close all other tabs' },
        { '<leader>ts', ':tabs<cr>', desc = 'List all tabs' },
        { '<leader>tw', ':tabnew<cr>', desc = 'New tab' },
    },
})
which_key.add({
    mode = 'n',
    silent = true,
    { '<leader>cc', ':qa<cr>', desc = 'Exit' },
    { '<leader>dd', ':windo diffthis<cr>', desc = 'Diff' },
    { '<leader>ee', ':OilOpenFloat<cr>', desc = 'Oil (Open)' },
    { '<leader>gg', ':LazyGit<cr>', desc = 'LazyGit (Open)' },
    { '<leader>hh', ':noh<cr>', desc = 'Highlights (Close)' },
    { '<leader>ll', ':Lazy<cr>', desc = 'Lazy (Open)' },
    { '<leader>mm', ':ObsidianOpenMarkdownFiles<cr>', desc = 'Markdown (Open)' },
    { '<leader>nn', ':Mason<cr>', desc = 'Mason (Open)' },
    { '<leader>oo', ':ObsidianOpenFiles<cr>', desc = 'Obsidian (Open)' },
    { '<leader>qq', ':q<cr>', desc = 'Buffer (Close)' },
    { '<leader>QQ', ':q!<cr>', desc = 'Buffer (Force Close)' },
    { '<leader>rr', ':so<cr>', desc = 'Source current file' },
    { '<leader>sc', ':colorscheme catppuccin<cr>', desc = 'Set Catppuccin' },
    { '<leader>sr', ':colorscheme rose-pine<cr>', desc = 'Set Rose Pine' },
    { '<leader>st', ':colorscheme tokyonight<cr>', desc = 'Set Tokyo Night' },
    { '<leader>ss', ':w<cr>', desc = 'Save' },
    { '<leader>SS', ':w!<cr>', desc = 'Save (Force)' },
    { '<leader>ww', ':WhichKey<cr>', desc = 'Which Key (Open)' },
    { '<leader>xx', ':x<cr>', desc = 'Save and close (if modified)' },
    { '<leader>vv', 'ggVG', desc = 'Select all' },
})
which_key.add({
    mode = 'n',
    { '<c-d>', '<C-d>zz', desc = 'Move half page down but keep cursor centered' },
    { '<c-u>', '<C-u>zz', desc = 'Move half page up but keep cursor centered' },
    { 'J', 'mzJ`z', desc = 'Append next line to current line' },
    { 'N', 'Nzzzv', desc = 'Search next but keep cursor centered' },
    { '[q', ':cp<cr>', desc = 'Previous quickfix item' },
    { ']q', ':cn<cr>', desc = 'Next quickfix item' },
    { '[t', ':tabn<cr>', desc = 'Go to next tab' },
    { ']t', ':tabp<cr>', desc = 'Go to previous tab' },
    { 'n', 'nzzzv', desc = 'Search previous but keep cursor centered' },
})
which_key.add({
    mode = { 'v' },
    { 'J', ':m \'>+1<CR>gv=gv', desc = 'Move selected line up' },
    { 'K', ':m \'<-2<CR>gv=gv', desc = 'Move selected line down' },
    { 'P', '"*p', desc = 'Paste from clipbord' },
    { 'Y', '"*y', desc = 'Yank to clipbord' },
})

