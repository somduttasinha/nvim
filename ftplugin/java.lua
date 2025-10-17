vim.keymap.set('n', '<leader>jtm', function()
    local java = require 'java'
    java.test.debug_current_method()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>jtc', function()
    local java = require 'java'
    java.test.debug_current_class()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>jtr', function()
    local java = require 'java'
    java.test.view_last_report()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>jr', function()
    local java = require 'java'
    java.runner.built_in.run_app {}
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>jl', function()
    local java = require 'java'
    java.runner.built_in.toggle_logs()
end, { noremap = true, silent = true })


vim.api.nvim_create_user_command('CleanJdtls', function()
    vim.fn.delete(vim.fn.expand '~/.cache/nvim/jdtls', 'rf')
    vim.fn.delete(vim.fn.expand '~/.cache/jdtls', 'rf')
    vim.fn.delete(vim.fn.expand '~/.local/share/jdtls', 'rf')
    print 'Deleted cache!'
end, {})

vim.lsp.inlay_hint.enable(false) -- disable inlay hints
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
