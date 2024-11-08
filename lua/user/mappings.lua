local ufo = require('ufo')
local which_key = require('which-key')

-- Which key mappings
which_key.add({
    mode = 'n',
    {
        { '<leader>C', desc = 'Close' },
        { '<leader>Ch', ':noh<cr>', desc = 'Highlights' },
        { '<leader>Cu', ':UndotreeHide', desc = 'Undotree' },
    },
    {
        { '<leader>E', desc = 'Edit' },
        { '<leader>Ea', 'ggVG', desc = 'Select all' },
        { '<leader>Ef', ufo.closeAllFolds, desc = 'Fold all' },
        { '<leader>Ep', '"*p', desc = 'Paste from clipbord' },
        { '<leader>Eu', ufo.openAllFolds, desc = 'Unfold all' },
        { '<leader>Ey', '"*y', desc = 'Yank to clipbord' },
    },
    {
        { '<leader>F', desc = 'File' },
        { '<leader>FC', ':q!<cr>', desc = 'Close (Force)' },
        { '<leader>FE', ':qa!<cr>', desc = 'Exit (Force)' },
        { '<leader>FS', ':w!<cr>', desc = 'Force save' },
        { '<leader>Fo', ':OilOpenFloat<cr>', desc = 'Open (Oil)' },
        { '<leader>Fc', ':q<cr>', desc = 'Close' },
        { '<leader>Fe', ':qa<cr>', desc = 'Exit' },
        { '<leader>Fo', ':so<cr>', desc = 'Source' },
        { '<leader>Fs', ':w<cr>', desc = 'Save' },
        { '<leader>Fx', ':x<cr>', desc = 'Save and close (if modified)' },
        { '<leader>Ftj', ':set filetype=json<cr>', desc = 'Set filetype to JSON' },
        { '<leader>Ftm', ':set filetype=markdown<cr>', desc = 'Set filetype to Markdown' },
        { '<leader>Ftp', ':set filetype=python<cr>', desc = 'Set filetype to Python' },
        { '<leader>Ftq', ':set filetype=sql<cr>', desc = 'Set filetype to SQL' },
        { '<leader>Fts', ':set filetype=sh<cr>', desc = 'Set filetype to shell' },
        { '<leader>Ftt', ':set filetype=typescript<cr>', desc = 'Set filetype to TypeScript' },
    },
    {
        { '<leader>O', desc = 'Open' },
        { '<leader>OM', ':Mason<cr>', desc = 'Mason' },
        { '<leader>Of', ':OilOpenFloat<cr>', desc = 'File (Oil)' },
        { '<leader>Og', ':LazyGit<cr>', desc = 'LazyGit' },
        { '<leader>Ol', ':Lazy<cr>', desc = 'Lazy' },
        { '<leader>Om', ':ObsidianOpenMarkdownFiles<cr>', desc = 'Markdown files' },
        { '<leader>Oo', ':ObsidianOpenFiles<cr>', desc = 'Obsidian files' },
        { '<leader>Ot', ':FTermOpen<cr>', desc = 'Terminal' },
        { '<leader>Ou', ':UndotreeShow', desc = 'Undotree' },
        { '<leader>Ow', ':WhichKey<cr>', desc = 'Which Key' },
    },
    {
        { '<leader>S', desc = 'Settings' },
        {
            { '<leader>St', desc = 'Theme' },
            { '<leader>Stc', ':colorscheme catppuccin<cr>', desc = 'Catppuccin' },
            { '<leader>Str', ':colorscheme rose-pine<cr>', desc = 'Rose Pine' },
            { '<leader>Stt', ':colorscheme tokyonight<cr>', desc = 'Tokyo Night' },
        },
    },
    {
        { '<leader>T', desc = 'Tabs' },
        { '<leader>T1', '1gt', desc = 'Go to tab 1' },
        { '<leader>T2', '2gt', desc = 'Go to tab 2' },
        { '<leader>T3', '3gt', desc = 'Go to tab 3' },
        { '<leader>T4', '4gt', desc = 'Go to tab 4' },
        { '<leader>T5', '5gt', desc = 'Go to tab 5' },
        { '<leader>TT', '<c-w>T', desc = 'Open buffer in a new tab' },
        { '<leader>Tc', ':tabclose<cr>', desc = 'Close current tab' },
        { '<leader>Te', ':tabedit<cr>', desc = 'Edit new tab' },
        { '<leader>Tf', ':tabfirst<cr>', desc = 'Go to first tab' },
        { '<leader>Tl', ':tablast<cr>', desc = 'Go to last tab' },
        { '<leader>Tn', ':tabnew<cr>', desc = 'New tab' },
        { '<leader>To', ':tabonly<cr>', desc = 'Close all other tabs' },
        { '<leader>Ts', ':tabs<cr>', desc = 'List all tabs' },
    },
})
which_key.add({
    mode = 'n',
    silent = true,
    { '<leader>oo', ':OilOpenFloat<cr>', desc = 'Open file (Oil)' },
    { '<leader>qQ', ':q!<cr>', desc = 'Close (Force)' },
    { '<leader>qq', ':q<cr>', desc = 'Close' },
})
which_key.add({
    mode = 'n',
    { '<c-d>', '<C-d>zz', desc = 'Move half page down but keep cursor centered' },
    { '<c-u>', '<C-u>zz', desc = 'Move half page up but keep cursor centered' },
    { 'J', 'mzJ`z', desc = 'Append next line to current line' },
    { 'N', 'Nzzzv', desc = 'Search next but keep cursor centered' },
    { '[q', ':cp<cr>', desc = 'Previous quickfix item' },
    { '[t', ':tabn<cr>', desc = 'Go to next tab' },
    { ']q', ':cn<cr>', desc = 'Next quickfix item' },
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

