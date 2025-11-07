vim.lsp.config('pyright', {
    settings = {
        pyright = {
            -- Disable Pyright's linting since ruff handles it
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                typeCheckingMode = 'basic',
            },
        },
    },
})
