return {
    cmd = { 'ltex-ls' },
    filetypes = { 'markdown', 'tex', 'plaintex', 'bib', 'gitcommit' },
    settings = {
        ltex = {
            enabled = true,
            language = 'en-GB',
            additionalRules = {
                motherTongue = 'en-GB',
            },
            dictionary = {
                ['en-GB'] = { 'Neovim', 'LTeX', 'ltex-ls', 'Akyildiz', 'Bolch' },
            },
            disabledRules = {
                ['en-GB'] = { 'EN_QUOTES', 'MORFOLOGIK_RULE_EN_GB', 'OXFORD_SPELLING_Z_NOT_S' },
            },
        },
    },
}