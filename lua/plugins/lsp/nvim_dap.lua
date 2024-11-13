return {
    'mfussenegger/nvim-dap',
    dependencies = {
        { 'rcarriga/nvim-dap-ui' },
        { 'nvim-neotest/nvim-nio' },
        { 'folke/lazydev.nvim' },
        { 'mxsdev/nvim-dap-vscode-js' },
        { 'theHamsta/nvim-dap-virtual-text' },
    },
    lazy = false,
    config = function()
        local dap = require('dap')
        local dap_ext_vscode = require('dap.ext.vscode')
        local dap_utils = require('dap.utils')
        local dap_ui = require('dapui')
        local dap_vscode_js = require('dap-vscode-js')
        local dap_virtual_text = require('nvim-dap-virtual-text')
        local lazydev = require('lazydev')
        local which_key = require('which-key')

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapLogPoint', { text = '󰰎', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointReject', { text = '', texthl = '', linehl = '', numhl = '' })

        dap_vscode_js.setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        dap.configurations.javascript = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file',
                program = '${file}',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach',
                processId = dap_utils.pick_process,
                cwd = '${workspaceFolder}',
            },
        }

        dap.configurations.typescript = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file',
                program = '${file}',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach',
                processId = dap_utils.pick_process,
                cwd = '${workspaceFolder}',
            },
        }

        lazydev.setup({
            library = {
                'nvim-dap-ui',
                'LazyVim',
            },
        })

        dap_ui.setup()

        dap_virtual_text.setup({
            enabled = true,                     -- enable this plugin (the default)
            enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = true,    -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = false,           -- show stop reason when stopped for exceptions
            commented = false,                  -- prefix virtual text with comment string
            only_first_definition = false,      -- only show virtual text at first definition (if there are multiple)
            all_references = true,              -- show virtual text on all all references of the variable (not only definitions)
            clear_on_continue = true,           -- clear virtual text on "continue" (might cause flickering when stepping)
            -- --- A callback that determines how a variable is displayed or whether it should be omitted
            -- --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
            -- --- @param buf number
            -- --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
            -- --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
            -- --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
            -- --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
            -- display_callback = function(variable, buf, stackframe, node, options)
            --     -- by default, strip out new line characters
            --     if options.virt_text_pos == 'inline' then
            --         return ' = ' .. variable.value:gsub("%s+", " ")
            --     else
            --         return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
            --     end
            -- end,
            -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
            virt_text_pos = 'eol',              -- virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
            -- experimental features:
            all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil,            -- position the virtual text at a fixed window column (starting from the first text column),
            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        })

        which_key.add({
            { '<leader>d', desc = 'DAP', icon = '' },
            { '<leader>db', function() dap.toggle_breakpoint() end, desc = 'Breakpoint', icon = '' },
            { '<leader>dc', function() dap.continue() end, desc = 'Continue', icon = '' },
            { '<leader>dd', function() dap_ui.toggle() end, desc = 'DAP UI', icon = '' },
            { '<leader>dh', function() dap.set_breakpoint(nil, vim.fn.input('Hits: '), nil) end, desc = 'Hits Breakpoint', icon = '󰰂' },
            { '<leader>di', function() dap.step_into() end, desc = 'Step into', icon = '' },
            { '<leader>dk', function() dap.step_back() end, desc = 'Step back', icon = '' },
            { '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Message: ')) end, desc = 'Log Breakpoint', icon = '󰰎' },
            { '<leader>do', function() dap.step_out() end, desc = 'Step out', icon = '' },
            { '<leader>dr', function() dap.restart() end, desc = 'Restart', icon = '' },
            { '<leader>ds', function() dap.run() end, desc = 'Start', icon = '' },
            { '<leader>dv', function() dap.step_over() end, desc = 'Step over', icon = '' },
            { '<leader>dx', function() dap.close() end, desc = 'Stop', icon = '' },
            { '<leader>dv', function() dap_ext_vscode.load_launchjs() end, desc = 'Load configs', icon = '' },
            { '<leader>d?', function() dap.set_breakpoint(vim.fn.input('Condition: '), nil, nil) end, desc = 'Conditional Breakpoint', icon = '' },
        })
    end,
}
