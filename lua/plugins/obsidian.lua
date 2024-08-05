return {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = false,
    -- ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    -- keys = {
    --     { '<leader>oo', '<cmd>ObsidianWorkspace local<cr><cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian files' },
    --     { '<leader>mm', '<cmd>ObsidianWorkspace current<cr><cmd>ObsidianQuickSwitch<cr>', desc = 'Markdown files' },
    -- },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- vim.opt.conceallevel = 2
        -- vim.g.vim_markdown_frontmatter = 1

        local obsidian = require('obsidian')
        local which_key = require('which-key')

        obsidian.setup({
            workspaces = {
                {
                    name = "current",
                    path = function()
                        -- alternatively use the CWD:
                        -- return assert(vim.fn.getcwd())
                        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                    end,
                    overrides = {
                        notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
                        new_notes_location = "current_dir",
                        templates = {
                            subdir = vim.NIL,
                        },
                        disable_frontmatter = true,
                    },
                },
                {
                    name = 'local',
                    path = '~/Documents/Obsidian/Local',
                },
            },
            notes_subdir = "Notes",
            daily_notes = {
                folder = 'notes/dailies',
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            note_id_func = function(title)
                local suffix = ""

                if title ~= nil then
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end

                return tostring(os.time()) .. "-" .. suffix
            end,
            note_frontmatter_func = function(note)
                if note.title then
                    note:add_alias(note.title)
                end

                local out = { id = note.id, aliases = note.aliases, tags = note.tags }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
            picker = {
                name = 'telescope.nvim',
                mappings = {
                    new = '<c-x>',
                    insert_link = '<c-l>',
                },
            },
        })

        which_key.add({
            mode = 'n',
            { '<leader>o', desc = 'Obsidian' },
            { '<leader>o30', ':ObsidianDailies -30 0<cr>', desc = 'Last 30 days notes' },
            { '<leader>o7', ':ObsidianDailies -7 0<cr>', desc = 'Last 7 days notes' },
            { '<leader>ob', ':ObsidianBackLinks<cr>', desc = 'Back links' },
            { '<leader>od', ':ObsidianDailies <cr>', desc = 'Dailies notes' },
            { '<leader>of', ':ObsidianFollowLink<cr>', desc = 'Follow link' },
            { '<leader>oi', ':ObsidianPasteImg ', desc = 'Paste image from clipboard' },
            { '<leader>ol', ':ObsidianLinks<cr>', desc = 'Show links' },
            { '<leader>on', ':ObsidianNew ', desc = 'New' },
            { '<leader>oo', ':ObsidianOpen ', desc = 'Open in app' },
            { '<leader>or', ':ObsidianTomorrow<cr>', desc = 'Tomorrow\'s note' },
            { '<leader>oq', ':ObsidianQuickSwitch<cr>', desc = 'Quick switch' },
            { '<leader>os', ':ObsidianSearch ', desc = 'Search' },
            { '<leader>ot', ':ObsidianToday<cr>', desc = 'Today\'s note' },
            { '<leader>oy', ':ObsidianYesterday<cr>', desc = 'Yesterday\'s note' },
            {
                { '<leader>ow', desc = 'Switch workspace' },
                { '<leader>own', ':ObsidianWorkspace current<cr>', desc = 'Current' },
                { '<leader>owl', ':ObsidianWorkspace local<cr>', desc = 'Local' },
                { '<leader>oww', ':ObsidianWorkspace waterkhair<cr>', desc = 'WaterKhair' },
            },
        })
        which_key.add({
            mode = 'v',
            { '<leader>o', desc = 'Obsidian' },
            { '<leader>oe', ':ObsidianExtractNote ', desc = 'Extract selected text to new note' },
            { '<leader>ol', ':ObsidianLink<cr>', desc = 'Link selected text' },
            { '<leader>on', ':ObsidianLinkNew ', desc = 'Link selected text to new note' },
        })
        which_key.add({
            mode = 'n',
            { '<c-x>', ':ObsidianToggleCheckbox<cr>', desc = 'Toggle checkbox' },
        })

        vim.api.nvim_create_user_command('ObsidianOpenFiles', function() vim.cmd('ObsidianWorkspace local') vim.cmd('ObsidianQuickSwitch') end, {})
        vim.api.nvim_create_user_command('ObsidianOpenMarkdownFiles', function() vim.cmd('ObsidianWorkspace current') vim.cmd('ObsidianQuickSwitch') end, {})
    end,
}
