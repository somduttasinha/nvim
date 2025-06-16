vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>i', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end)


