return {
    {
        'nvim-java/nvim-java',
        config = function()
            require('java').setup()
        end,
    },

    {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').jdtls.setup {}
        end,
    },
}
