return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require 'nvim-treesitter.configs'

    config.setup {
      auto_install = true,
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'html', 'markdown', 'python', 'java', 'go', 'r', 'cmake' },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
