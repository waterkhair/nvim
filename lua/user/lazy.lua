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
    --{ 'echasnovski/mini.bufremove' }, -- Buffer removing (unshow, delete, wipeout), which saves window layout.
    --{ 'folke/neodev.nvim' }, -- Setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    --{ 'mrjones2014/smart-splits.nvim' }, -- Supports seamless navigation between Neovim and terminal multiplexer split panes.
    --{ 'numToStr/Comment.nvim' }, --  Smart and Powerful commenting plugin for neovim.
    --{ 'rafamadriz/friendly-snippets' }, -- Snippets collection for a set of different programming languages.
    --{ 'mfussenegger/nvim-dap' }, -- Debug Adapter Protocol client implementation for Neovim.
    --{ 'rcarriga/cmp-dap' }, -- nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers.
    --{ 'rcarriga/nvim-dap-ui' }, -- A UI for nvim-dap which provides a good out of the box configuration.
    --{ 'stevearc/dressing.nvim' }, -- Override vim.ui.select and vim.ui.input with improvements upon the default behavior
    --{ 'CosmicNvim/cosmic-ui' }, -- Provide a quick and easy way to create a Cosmic UI experience with Neovim!
    --{ 'glepnir/dashboard-nvim' }, -- Fancy and Blazing Fast start screen plugin of neovim.
    --{ 'simrat39/symbols-outline.nvim' }, -- A tree like view for symbols in Neovim using the LSP.
    --{ 'nvimtools/none-ls.nvim' }, -- null-ls.nvim Reloaded, maintained by the community.
    --{ 'Exafunction/codeium.nvim' }, -- Native Codeium plugin for Neovim.
    --{ 'gbprod/yanky.nvim' }, -- Improve yank and put functionalities for Neovim.
    --{ 'theHamsta/nvim-dap-virtual-text' }, -- Adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
    --{ 'jay-babu/mason-nvim-dap.nvim' }, -- Bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together.
    --{ 'folke/edgy.nvim' }, -- Easily create and manage predefined window layouts, bringing a new edge to your workflow.
    --{ 'stevearc/conform.nvim' }, -- Lightweight yet powerful formatter plugin for Neovim.
    --{ 'nvim-neotest/neotest' }, -- An extensible framework for interacting with tests within NeoVim.
    --{ 'echasnovski/mini.animate' }, -- Fast and flexible start screen.
    --{ 'ahmedkhalf/project.nvim' }, -- An all in one neovim plugin written in lua that provides superior project management.
    --{ 'mfussenegger/nvim-lint' }, -- An asynchronous linter plugin for Neovim (>= 0.6.0) complementary to the built-in LSP support.
    --{ 'dstein64/vim-startuptime' }, -- A plugin for viewing vim and nvim startup event timing information.
    --{ 'lewis6991/gitsigns.nvim' }, -- Super fast git decorations implemented purely in Lua.

    -- Themes
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }, -- Catppuccin for (Neo)vim
    { 'rose-pine/neovim', name = 'rose-pine' }, -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
    --{ 'folke/tokyonight.nvim' }, -- A dark and light Neovim theme written in Lua.
    {
        'folke/noice.nvim', -- Completely replaces the UI for messages, cmdline and the popupmenu.
        dependencies = {
            'MunifTanjim/nui.nvim', -- UI Component Library for Neovim.
            'rcarriga/nvim-notify', -- A fancy, configurable, notification manager for NeoVim.
        },
    },

    -- Fuzy Finder
    {
        'nvim-telescope/telescope.nvim', -- Highly extendable fuzzy finder over lists.
        dependencies = {
            'nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
        },
    },
    -- Coding
    { 'neovim/nvim-lspconfig' }, -- Configs for the Nvim LSP client.
    { 'williamboman/mason-lspconfig.nvim' }, -- Bridges mason.nvim with the lspconfig plugin

    -- Autocomplete
    { 'hrsh7th/cmp-buffer' }, -- nvim-cmp source for buffer words.
    { 'hrsh7th/cmp-path' }, -- nvim-cmp source for filesystem paths.
    { 'hrsh7th/cmp-nvim-lua' }, -- nvim-cmp source for neovim Lua API.
    { 'hrsh7th/cmp-nvim-lsp' }, -- nvim-cmp source for neovim's built-in language server client.
    { 'hrsh7th/nvim-cmp' }, -- A completion engine plugin for neovim written in Lua.
    { 'L3MON4D3/LuaSnip' }, -- Snippets
    { 'github/copilot.vim' }, -- Uses OpenAI Codex to suggest code and entire functions in real-time right from your editor.
    { 'onsails/lspkind.nvim' }, -- Adds vscode-like pictograms to neovim built-in lsp:
    --{ 'tzachar/cmp-tabnine' }, -- Tabnine source for hrsh7th/nvim-cmp.
    --{ 'saadparwaiz1/cmp_luasnip' }, -- luasnip completion source for nvim-cmp.
    --{ 'NMAC427/guess-indent.nvim' }, -- Blazing fast indentation style detection for Neovim written in Lua.
    --{ 'lukas-reineke/indent-blankline.nvim' }, -- Adds indentation guides to Neovim.

    -- Coding
    {
        'nvim-treesitter/nvim-treesitter', -- Provides a simple and easy way to use the interface for tree-sitter.
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring', -- Setting the commentstring option based on the cursor location in the file.
            'nvim-treesitter/nvim-treesitter-textobjects', -- Syntax aware text-objects, select, move, swap, and peek support.
            { "windwp/nvim-ts-autotag", opts = { autotag = { enable_close_on_slash = false } } }, -- Use treesitter to autoclose and autorename html tag.
        },
        build = ':TSUpdate',
    },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }, -- Makes Neovim's fold look modern and keep high performance.

    -- Navigation
    { 'nvim-tree/nvim-tree.lua', version = '*', lazy = false, dependencies = { 'nvim-tree/nvim-web-devicons', } }, -- A File Explorer For Neovim.
    { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' }, -- A snazzy buffer line for Neovim.
    { 'theprimeagen/harpoon' }, -- Getting you where you want with the fewest keystrokes.
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } }, -- A blazing fast and easy to configure Neovim statusline.
    { 'folke/which-key.nvim', event = 'VeryLazy', init = function() vim.o.timeout = true vim.o.timeoutlen = 300 end }, -- Displays a popup with possible key bindings.
    { 'mbbill/undotree' }, -- Visualizes the undo history and makes it easy to browse and switch between different undo branches.

    -- Utils
    { 'williamboman/mason.nvim' }, -- Portable package manager for Neovim that runs everywhere Neovim runs.
    { 'kdheepak/lazygit.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, }, -- Plugin for calling lazygit from within neovim.
    { 'akinsho/toggleterm.nvim', version = '*', config = true }, -- A neovim plugin to persist and toggle multiple terminals.
    --{ 'voldikss/vim-floaterm' }, -- Use (neo)vim terminal in the floating/popup window.
})

vim.keymap.set('n', '<leader>ll', ':Lazy<CR>', { silent = true })

