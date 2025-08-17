return {
    -- Mason: LSP/DAP/Linter installer
    {
        'mason-org/mason.nvim',
        opts = {
            registries = {
                'github:nvim-java/mason-registry',
                'github:mason-org/mason-registry',
            },
        },
    },
    -- LSP config
    { 'neovim/nvim-lspconfig' },
    -- Mason LSP bridge
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = { 'lua_ls', 'pyright', 'ltex', 'texlab', 'jdtls', 'gopls' },
        },
    },
    -- JSON/YAML schema store
    { 'b0o/schemastore.nvim' },
    -- Lua LSP for Neovim config/dev
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
}
