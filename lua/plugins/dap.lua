return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'

            dapui.setup()

            vim.keymap.set('n', '<Leader>dc', function()
                dap.continue()
            end)

            vim.keymap.set('n', '<F10>', function()
                dap.step_over()
            end)

            vim.keymap.set('n', '<F11>', function()
                dap.step_into()
            end)

            vim.keymap.set('n', '<F12>', function()
                dap.step_out()
            end)

            vim.keymap.set('n', '<Leader>dt', function()
                dap.toggle_breakpoint()
            end)

            vim.keymap.set('n', '<Leader>B', function()
                dap.set_breakpoint()
            end)

            vim.keymap.set('n', '<Leader>lp', function()
                dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
            end)

            vim.keymap.set('n', '<Leader>dr', function()
                dap.repl.open()
            end)

            vim.keymap.set('n', '<Leader>dl', function()
                dap.run_last()
            end)

            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end)

            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)

            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require 'dap.ui.widgets'
                widgets.centered_float(widgets.frames)
            end)

            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require 'dap.ui.widgets'
                widgets.centered_float(widgets.scopes)
            end)

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        'nvim-neotest/nvim-nio'
    },
    {
        'rcarriga/cmp-dap',
    },
    {
        'rcarriga/nvim-dap-ui',
    },
    {
        'leoluz/nvim-dap-go',
        ft = 'go',
        depends = 'mfussenegger/nvim-dap',
        config = function()
            require('dap-go').setup()
        end,
    },
}
