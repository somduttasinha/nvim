return {
    'github/copilot.vim',
    config = function()
        vim.api.nvim_set_keymap('i', '<CR>', 'copilot#Accept("<CR>")', {
            expr = true,
            silent = true,
            noremap = true,
            replace_keycodes = false,
        })
    end,
}
