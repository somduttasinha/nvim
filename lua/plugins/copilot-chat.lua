return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim', branch = 'master' },
        },
        build = 'make tiktoken',
        config = function(_, opts)
            require('CopilotChat').setup(opts)
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
            vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { silent = true, noremap = true })
            -- Quick chat keybinding
            vim.keymap.set('n', '<leader>ccq', function()
                local input = vim.fn.input 'Quick Chat: '
                if input ~= '' then
                    require('CopilotChat').ask(input, {
                        selection = require('CopilotChat.select').buffer,
                    })
                end
            end, { desc = 'CopilotChat - Quick chat' })
        end,
        opts = {
            model = 'gpt-4.1', -- AI model to use
            temperature = 0.1, -- Lower = focused, higher = creative
            window = {
                layout = 'vertical',
                width = 80, -- Fixed width in columns
                height = 20, -- Fixed height in rows
                border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
                title = '🤖 AI Assistant',
                zindex = 100, -- Ensure window stays on top
            },

            headers = {
                user = '👤 You: ',
                assistant = '🤖 Copilot: ',
                tool = '🔧 Tool: ',
            },
            separator = '━━',
            show_folds = false, -- Disable folding for cleaner look
            auto_insert_mode = true, -- Enter insert mode when opening
        },
    },
}
