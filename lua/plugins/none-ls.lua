return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      debug = true,
      sources = {
        -- null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.actionlint,
        --null_ls.builtins.diagnostics.checkstyle.with {
        --  extra_args = { '-c', '/sun_checks.xml' },
        --},

        -- null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.solhint,

        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports_reviser,

        null_ls.builtins.formatting.black,

        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.formatting.fourmolu,
      },
    }

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
