return {
    'ggandor/leap.nvim',
    config = function()
        vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap)')
        vim.keymap.set('n', '<leader>S', '<Plug>(leap-from-window)')
    end,
}
