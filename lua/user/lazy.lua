local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

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
    -- Interesting plugins to review
    --{ 'folke/neodev.nvim' }, -- Setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
    --{ 'stevearc/dressing.nvim' }, -- Override vim.ui.select and vim.ui.input with improvements upon the default behavior
    --{ 'glepnir/dashboard-nvim' }, -- Fancy and Blazing Fast start screen plugin of neovim
    --{ 'Exafunction/codeium.nvim' }, -- Native Codeium plugin for Neovim
    --{ 'mrjones2014/smart-splits.nvim' }, -- Supports seamless navigation between Neovim and terminal multiplexer split panes
    --{ 'simrat39/symbols-outline.nvim' }, -- A tree like view for symbols in Neovim using the LSP
    --{ 'folke/edgy.nvim' }, -- Easily create and manage predefined window layouts, bringing a new edge to your workflow
    --{ 'echasnovski/mini.animate' }, -- Fast and flexible start screen.
    --{ 'ahmedkhalf/project.nvim' }, -- An all in one neovim plugin written in lua that provides superior project management
    --{ 'mfussenegger/nvim-lint' }, -- An asynchronous linter plugin for Neovim (>= 0.6.0) complementary to the built-in LSP support
    --{ 'voldikss/vim-floaterm' }, -- Use (neo)vim terminal in the floating/popup window
    --{ 'plugins.toggleterm' }, -- A neovim plugin to persist and toggle multiple terminals
    --{ 'gbprod/yanky.nvim', opts = {}, lazy = true }, -- Improve yank and put functionalities for Neovim
    --{ 'mfussenegger/nvim-dap' }, -- Debug Adapter Protocol client implementation for Neovim
    --{ 'stevearc/conform.nvim' }, -- Lightweight yet powerful formatter plugin for Neovim
    --{ 'rcarriga/cmp-dap' }, -- nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
    --{ 'rcarriga/nvim-dap-ui' }, -- A UI for nvim-dap which provides a good out of the box configuration
    --{ 'CosmicNvim/cosmic-ui' }, -- Provide a quick and easy way to create a Cosmic UI experience with Neovim!
    --{ 'theHamsta/nvim-dap-virtual-text' }, -- Adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions
    --{ 'jay-babu/mason-nvim-dap.nvim' }, -- Bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together
    --{ 'nvim-neotest/neotest' }, -- An extensible framework for interacting with tests within NeoVim
    --{ 'lukas-reineke/indent-blankline.nvim' }, -- Adds indentation guides to Neovim

    -- Themes
    { 'nvim-lua/plenary.nvim', lazy = true }, -- All the lua functions I don't want to write twice.
    require('plugins.catppuccin'), -- Catppuccin for (Neo)vim
    require('plugins.rose_pine'), -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist
    require('plugins.tokyonight'), -- A dark and light Neovim theme written in Lua
    require('plugins.noice'), -- Completely replaces the UI for messages, cmdline and the popupmenu
    require('plugins.notify'), -- A fancy, configurable, notification manager for NeoVim

    -- Fuzy Finder
    { 'nvim-telescope/telescope.nvim', lazy = true }, -- Highly extendable fuzzy finder over lists

    -- Autocomplete
    { 'hrsh7th/cmp-buffer' }, -- nvim-cmp source for buffer words
    { 'hrsh7th/cmp-path' }, -- nvim-cmp source for filesystem paths
    { 'hrsh7th/cmp-nvim-lua' }, -- nvim-cmp source for neovim Lua API
    { 'hrsh7th/cmp-nvim-lsp' }, -- nvim-cmp source for neovim's built-in language server client
    { 'hrsh7th/nvim-cmp' }, -- A completion engine plugin for neovim written in Lua
    { 'L3MON4D3/LuaSnip', lazy = true }, -- Snippets
    { 'github/copilot.vim' }, -- Uses OpenAI Codex to suggest code and entire functions in real-time right from your editor
    { 'onsails/lspkind.nvim' }, -- Adds vscode-like pictograms to neovim built-in lsp:
    { 'saadparwaiz1/cmp_luasnip', lazy = true }, -- luasnip completion source for nvim-cmp.
    { 'rafamadriz/friendly-snippets', lazy = true }, -- Snippets collection for a set of different programming languages
    { 'nvimtools/none-ls.nvim', lazy = true }, -- null-ls.nvim Reloaded, maintained by the community
    { 'NMAC427/guess-indent.nvim', opts = { filetype_exclude = { 'Nvimtree' } } }, -- Blazing fast indentation style detection for Neovim written in Lua

    -- Coding
    { 'neovim/nvim-lspconfig', lazy = true }, -- Configs for the Nvim LSP client
    { 'williamboman/mason-lspconfig.nvim', lazy = true }, -- Bridges mason.nvim with the lspconfig plugin
    { 'numToStr/Comment.nvim', opts = {} }, -- Smart and Powerful commenting plugin for neovim
    require('plugins.treesitter'), -- Provides a simple and easy way to use the interface for tree-sitter
    require('plugins.nvim_ufo'), -- Makes Neovim's fold look modern and keep high performance

    -- Navigation
    { 'theprimeagen/harpoon', lazy = true }, -- Getting you where you want with the fewest keystrokes
    { 'mbbill/undotree' }, -- Visualizes the undo history and makes it easy to browse and switch between different undo branches
    { 'moll/vim-bbye' }, -- Allows you to do delete buffers (close files) without closing your windows or messing up your layout
    require('plugins.tree'), -- A File Explorer For Neovim
    require('plugins.bufferline'), -- A snazzy buffer line (with tabpage integration) for Neovim built using lua
    require('plugins.lualine'), -- A blazing fast and easy to configure Neovim statusline
    require('plugins.which_key'), -- Displays a popup with possible key bindings

    -- Utils
    { 'williamboman/mason.nvim', opts = {} }, -- Portable package manager for Neovim that runs everywhere Neovim runs
    { 'kdheepak/lazygit.nvim', lazy = true }, -- Plugin for calling lazygit from within neovim
    { 'dstein64/vim-startuptime' }, -- A plugin for viewing vim and nvim startup event timing information
    { 'numToStr/FTerm.nvim', lazy = true }, -- No-nonsense floating terminal plugin for neovim
    { 'lewis6991/gitsigns.nvim', lazy = true }, -- Super fast git decorations implemented purely in Lua
})

