return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.todo_comments,
        null_ls.builtins.diagnostics.checkstyle.with {
         extra_args = { '-c', '/Users/somsinha/.config/nvim/checkstyle/java_checks.xml' },
        },
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.prettierd,
      },
    }

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
