return {
    'mfussenegger/nvim-dap',
    dependencies = {
        { 'rcarriga/nvim-dap-ui' },
        { 'nvim-neotest/nvim-nio' },
        { 'folke/lazydev.nvim' },
        { 'mxsdev/nvim-dap-vscode-js' },
    },
    lazy = false,
    config = function()
        local dap = require('dap')
        local dap_utils = require('dap.utils')
        local dapui = require('dapui')
        local dapvscodejs = require('dap-vscode-js')
        local lazydev = require('lazydev')
        local which_key = require('which-key')

        -- dap.set_log_level('TRACE')
        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapLogPoint', { text = '󰰎', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointReject', { text = '', texthl = '', linehl = '', numhl = '' })

        dapvscodejs.setup({
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
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Debug Jest Tests',
                -- trace = true, -- include debugger info
                runtimeExecutable = 'node',
                runtimeArgs = {
                    './node_modules/jest/bin/jest.js',
                    '--runInBand',
                },
                rootPath = '${workspaceFolder}',
                cwd = '${workspaceFolder}',
                console = 'integratedTerminal',
                internalConsoleOptions = 'neverOpen',
            },
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Debug Mocha Tests',
                -- trace = true, -- include debugger info
                runtimeExecutable = 'node',
                runtimeArgs = {
                    './node_modules/mocha/bin/mocha.js',
                },
                rootPath = '${workspaceFolder}',
                cwd = '${workspaceFolder}',
                console = 'integratedTerminal',
                internalConsoleOptions = 'neverOpen',
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
        }

        lazydev.setup({
            library = {
                'nvim-dap-ui',
                'LazyVim',
            },
        })

        dapui.setup()

        which_key.add({
            mode = 'n',
            { '<leader>d', desc = 'DAP', icon = '' },
            { '<leader>db', function() dap.toggle_breakpoint() end, desc = 'Breakpoint', icon = '' },
            { '<leader>dc', function() dap.continue() end, desc = 'Continue', icon = '' },
            { '<leader>dd', function() dapui.toggle() end, desc = 'DAP UI', icon = '' },
            { '<leader>dh', function() dap.set_breakpoint(nil, vim.fn.input('Hits: '), nil) end, desc = 'Hits Breakpoint', icon = '󰰂' },
            { '<leader>di', function() dap.step_into() end, desc = 'Step into', icon = '' },
            { '<leader>dk', function() dap.step_back() end, desc = 'Step back', icon = '' },
            { '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Message: ')) end, desc = 'Log Breakpoint', icon = '󰰎' },
            { '<leader>do', function() dap.step_out() end, desc = 'Step out', icon = '' },
            { '<leader>dr', function() dap.restart() end, desc = 'Restart', icon = '' },
            { '<leader>ds', function() dap.run() end, desc = 'Start', icon = '' },
            { '<leader>dv', function() dap.step_over() end, desc = 'Step over', icon = '' },
            { '<leader>dx', function() dap.close() end, desc = 'Stop', icon = '' },
            { '<leader>d?', function() dap.set_breakpoint(vim.fn.input('Condition: '), nil, nil) end, desc = 'Conditional Breakpoint', icon = '' },
        })
    end,
}
