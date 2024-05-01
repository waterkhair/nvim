return {
    'skywind3000/vim-quickui',
    lazy = false,
    config = function()
        vim.g.quickui_color_scheme = 'papercol light'

        local which_key = require('which-key')

        which_key.register({
            ['.'] = {
                function()
                    vim.call(
                        'quickui#context#open',
                        {
                            { '&Yank to clipboard\tLeader+E+y', 'normal "*y' },
                            { '&Paste from clipboard\tLeader+E+p', 'nroaml "*p' }
                        },
                        { index = 'g:quickui#context#cursor' }
                    )
                end,
                'Context Menu'
            },
            ['<leader>'] = { function() vim.call('quickui#menu#open', 'normal') end, 'Menu' },
        }, {
            mode = 'n',
            prefix = '<leader>',
        })
        vim.call('quickui#menu#switch', 'normal')
        vim.call('quickui#menu#reset')
        vim.call('quickui#menu#install',
            '&File',
            {
                { '&Save\tLeader+F+s', 'w' },
                { 'Save (&Force)\tLeader+F+S', 'w!' },
                { 'Save and close (if &modified)\tLeader+F+x', 'x' },
                { 'S&ource\tLeader+F+o', 'so' },
                { '&Close\tLeader+F+c', 'q' },
                { 'Close (Fo&rce)\tLeader+F+C', 'q!' },
                { '&Exit\tLeader+F+e', 'qa' },
                { 'Exi&t (Force)\tLeader+F+E', 'qa!' }
            }
        )
        vim.call('quickui#menu#install',
            '&Edit',
            {
                { 'Select &all\tLeader+E+a', 'normal ggVG' },
                { 'Guess &identation\tLeader+E+i', 'GuessIndent' },
                { '&Yank to clipboard\tLeader+E+y', 'normal "*y' },
                { '&Paste from clipboard\tLeader+E+p', 'normal "*p' },
                { '&Fold all\tLeader+E+z', 'UfoCloseAllFolds'  },
                { '&Unfold all\tLeader+E+Z', 'UfoOpenAllFolds' },
            }
        )
        vim.call('quickui#menu#install',
            '&Close',
            {
                { 'File &explorer\tLeader+C+e', 'NvimTreeClose' },
                { '&Highlights\tLeader+C+h', 'noh' },
                { '&Undotree\tLeader+C+u', 'UndotreeHide' },
            }
        )
        vim.call('quickui#menu#install',
            '&Open',
            {
                { 'File &explorer\tLeader+O+e', 'NvimTreeOpen' },
                { '&File (Oil)\tLeader+O+f', 'OilOpenFloat' },
                { '&Markdown files\tLeader+O+m', 'ObsidianOpenMarkdownFiles' },
                { '&Obsidian files\tLeader+O+o', 'ObsidianOpenFiles' },
                { '&Undotree\tLeader+O+u', 'UndotreeShow' },
                { '&Terminal\tLeader+O+t', 'FTermOpen' },
                { 'Lazy&Git\tLeader+O+g', 'LazyGit' },
                { '&Lazy\tLeader+O+l', 'Lazy' },
                { 'Maso&n\tLeader+O+M', 'Mason' },
            }
        )
        vim.call('quickui#menu#install',
            '&Tabs',
            {
                { 'Go to tab &1\tLeader+T+1', 'normal 1gt' },
                { 'Go to tab &2\tLeader+T+2', 'normal 2gt' },
                { 'Go to tab &3\tLeader+T+3', 'normal 3gt' },
                { 'Go to tab &4\tLeader+T+4', 'normal 4gt' },
                { 'Go to tab &5\tLeader+T+5', 'normal 5gt' },
                { 'Go to &first tab\tLeader+T+f', 'tabfirst' },
                { '&Go to &last tab\tLeader+T+l', 'tablast' },
                { '&Edit new tab\tLeader+T+e', 'tabedit' },
                { '&New tab\tLeader+T+', 'tabnew' },
                { '&Open buffer in a new tab\tLeader+T+', 'normal <c-w>T' },
                { '&Close current tab\tLeader+T+c', 'tabclose' },
                { 'Close all &other tabs\tLeader+T+o', 'tabonly' },
                { 'Li&st all tabs\tLeader+T+', 'tabs' },
            }
        )
        vim.call('quickui#menu#install',
            '&Settings',
            {
                { '&Catppuccin\tLeader+S+c', 'colorscheme catppuccin' },
                { '&Tokyo Night\tLeader+S+t', 'colorscheme tokyonight' },
                { '&Rose Pine\tLeader+S+r', 'colorscheme rose-pine' },
            }
        )

        which_key.register({
            ['.'] = {
                function()
                    vim.call(
                        'quickui#context#open',
                        {
                            { '&Yank to clipboard\tLeader+E+y', 'normal "*y' },
                            { '&Paste from clipboard\tLeader+E+p', 'nroaml "*p' }
                        },
                        { index = 'g:quickui#context#cursor' }
                    )
                end,
                'Context Menu'
            },
        }, {
            mode = 'v',
        })
    end,
}

