local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Leader key = space
vim.g.mapleader = ' '

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.lsp' },
    { import = 'plugins.navigation' },
    { import = 'plugins.notes' },
    { import = 'plugins.ui' },
    { import = 'plugins.vcs' },
    -- Interesting plugins to review
    --{ 'simrat39/symbols-outline.nvim' }, -- A tree like view for symbols in Neovim using the LSP
    --{ 'folke/edgy.nvim' }, -- Easily create and manage predefined window layouts, bringing a new edge to your workflow
    --{ 'echasnovski/mini.animate' }, -- Fast and flexible start screen.
    --{ 'ahmedkhalf/project.nvim' }, -- An all in one neovim plugin written in lua that provides superior project management
    --{ 'mfussenegger/nvim-lint' }, -- An asynchronous linter plugin for Neovim (>= 0.6.0) complementary to the built-in LSP support
    --{ 'rcarriga/cmp-dap' }, -- nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
    --{ 'CosmicNvim/cosmic-ui' }, -- Provide a quick and easy way to create a Cosmic UI experience with Neovim!
    --{ 'theHamsta/nvim-dap-virtual-text' }, -- Adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions
    --{ 'jay-babu/mason-nvim-dap.nvim' }, -- Bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together
    --{ 'nvim-neotest/neotest' }, -- An extensible framework for interacting with tests within NeoVim
    --{ 'lukas-reineke/indent-blankline.nvim' }, -- Adds indentation guides to Neovim
    --{ 'nvim-lua/plenary.nvim' }, -- All the lua functions I don't want to write twice.
})

