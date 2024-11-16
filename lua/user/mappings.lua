local which_key = require('which-key')

-- Which key mappings
which_key.add({
    {
        { '<leader>t', desc = 'Tabs', icon = '󰓩' },
        { '<leader>t1', '1gt', desc = 'Tab 1' },
        { '<leader>t2', '2gt', desc = 'Tab 2' },
        { '<leader>t3', '3gt', desc = 'Tab 3' },
        { '<leader>t4', '4gt', desc = 'Tab 4' },
        { '<leader>t5', '5gt', desc = 'Tab 5' },
        { '<leader>tt', '<c-w>T', desc = 'Open buffer in a new tab' },
        { '<leader>tc', ':tabclose<cr>', desc = 'Close current' },
        { '<leader>te', ':tabedit<cr>', desc = 'Edit new' },
        { '<leader>tf', ':tabfirst<cr>', desc = 'First', },
        { '<leader>tl', ':tablast<cr>', desc = 'Last', },
        { '<leader>tn', ':tabnext<cr>', desc = 'Next', },
        { '<leader>tp', ':tabprev<cr>', desc = 'Previous', },
        { '<leader>to', ':tabonly<cr>', desc = 'Close other', },
        { '<leader>ts', ':tabs<cr>', desc = 'List all', },
        { '<leader>tw', ':tabnew<cr>', desc = 'New', },
    },
    {
        { '<leader>s', desc = 'Settings', icon = '' },
        {
            { '<leader>st', desc = 'Themes', icon = '' },
            { '<leader>stc', ':colorscheme catppuccin<cr>', desc = 'Catppuccin', icon = '' },
            { '<leader>str', ':colorscheme rose-pine<cr>', desc = 'Rose Pine', icon = '󰐅' },
            { '<leader>stt', ':colorscheme tokyonight<cr>', desc = 'Tokyo Night', icon = '' },
        },
        {
            { '<leader>sf', desc = 'Filetype', icon = '' },
            { '<leader>sfj', ':set filetype=json<cr>', desc = 'JSON', icon = '' },
            { '<leader>sfl', ':set filetype=lua<cr>', desc = 'Lua', icon = '' },
            { '<leader>sfm', ':set filetype=markdown<cr>', desc = 'Markdown', icon = '' },
            { '<leader>sfp', ':set filetype=python<cr>', desc = 'Python', icon = '' },
            { '<leader>sfq', ':set filetype=sql<cr>', desc = 'SQL', icon = '' },
            { '<leader>sfs', ':set filetype=sh<cr>', desc = 'Shell', icon = '' },
            { '<leader>sft', ':set filetype=typescript<cr>', desc = 'TypeScript', icon = '' },
            { '<leader>sfv', ':set filetype=javascript<cr>', desc = 'JavaScript', icon = '' },
        },
    },
})
which_key.add({
    hidden = true,
    {
        -- Navigation
        { '<leader>cc', ':qa<cr>', desc = 'Exit', icon = '󱎘' },
        { '<leader>hh', ':split<cr>', desc = 'Horizontal split', icon = '' },
        { '<leader>qq', ':q<cr>', desc = 'Buffer (Close)' },
        { '<leader>QQ', ':q!<cr>', desc = 'Buffer (Force Close)' },
        { '<leader>rr', ':so<cr>', desc = 'Source current file' },
        { '<leader>ss', ':w<cr>', desc = 'Save', icon = '' },
        { '<leader>SS', ':w!<cr>', desc = 'Save (Force)' },
        { '<leader>xx', ':x<cr>', desc = 'Save and close (if modified)' },
        { '<leader>vv', ':vsplit<cr>', desc = 'Vertical split', icon = '' },
        { '<leader>VV', 'ggVG', desc = 'Select all' },
        { '<leader>ww', ':windo diffthis<cr>', desc = 'Diff' },
    },
    {
        -- Tools
        { '<leader>ii', ':NvimWebDeviconsHiTest<cr>', desc = 'Web Devicons (Open)' },
        { '<leader>ll', ':Lazy<cr>', desc = 'Lazy (Open)' },
        { '<leader>xc', ':noh<cr>', desc = 'Highlights (Close)' },
    },
})
which_key.add({
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

