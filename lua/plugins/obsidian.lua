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

        which_key.register({
            o = {
                'Obsidian',
                ['30'] = { ':ObsidianDailies -30 0<cr>', 'Last 30 days notes' },
                ['7'] = { ':ObsidianDailies -7 0<cr>', 'Last 7 days notes' },
                b = { ':ObsidianBackLinks<cr>', 'Back links' },
                d = { ':ObsidianDailies <cr>', 'Dailies notes' },
                f = { ':ObsidianFollowLink<cr>', 'Follow link' },
                i = { ':FineCmdline<cr>ObsidianPasteImg ', 'Paste image from clipboard' },
                l = { ':ObsidianLinks<cr>', 'Show links' },
                n = { ':FineCmdline<cr>ObsidianNew ', 'New' },
                o = { ':FineCmdline<cr>ObsidianOpen ', 'Open in app' },
                r = { ':ObsidianTomorrow<cr>', 'Tomorrow\'s note' },
                q = { ':ObsidianQuickSwitch<cr>', 'Quick switch' },
                s = { ':FineCmdline<cr>ObsidianSearch ', 'Search' },
                t = { ':ObsidianToday<cr>', 'Today\'s note' },
                y = { ':ObsidianYesterday<cr>', 'Yesterday\'s note' },
                w = {
                    'Switch workspace',
                    n = { ':ObsidianWorkspace current<cr>', 'Current' },
                    l = { ':ObsidianWorkspace local<cr>', 'Local' },
                    w = { ':ObsidianWorkspace waterkhair<cr>', 'WaterKhair' },
                },
            },
        }, {
            mode = 'n',
            prefix = '<leader>',
        })
        which_key.register({
            o = {
                'Obsidian',
                e = { '<cmd>FineCmdline<cr>ObsidianExtractNote ', 'Extract selected text to new note' },
                l = { ':ObsidianLink<cr>', 'Link selected text' },
                n = { '<cmd>FineCmdline<cr>ObsidianLinkNew ', 'Link selected text to new note' },
            },
        }, {
            mode = 'v',
            prefix = '<leader>',
        })
        which_key.register({
            ['<c-x>'] = { ':ObsidianToggleCheckbox<cr>', 'Toggle checkbox' },
        }, {
            mode = 'n',
        })

        vim.api.nvim_create_user_command('ObsidianOpenFiles', function() vim.cmd('ObsidianWorkspace current') vim.cmd('ObsidianQuickSwitch') end, {})
        vim.api.nvim_create_user_command('ObsidianOpenMarkdownFiles', function() vim.cmd('ObsidianWorkspace local') vim.cmd('ObsidianQuickSwitch') end, {})
    end,
}
