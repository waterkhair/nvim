-- Blazing fast indentation style detection for Neovim written in Lua
return {
    'NMAC427/guess-indent.nvim',
    lazy = true,
    init = function()
        require('guess-indent').setup({
            filetype_exclude = { 'Nvimtree' },
        })
    end,
}

