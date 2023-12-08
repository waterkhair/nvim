-- Blazing fast indentation style detection for Neovim written in Lua
return {
    'NMAC427/guess-indent.nvim',
    config = function()
        require('guess-indent').setup({
            filetype_exclude = { 'Nvimtree' },
        })
    end,
}

