return {
    'MysticalDevil/inlay-hints.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
        require('inlay-hints').setup {
            commands = { enable = true },
            autocmd = { emable = true },
        }
    end,
}
