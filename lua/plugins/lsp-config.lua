return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'jdtls', 'gopls', 'hls', 'pyright' },
      }
    end,
  },
  {
    'b0o/schemastore.nvim',
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require 'lspconfig'
      local opts = {}
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      lspconfig.r_language_server.setup {
        capabilities = capabilities,
      }

      lspconfig.lemminx.setup {
        capabilities = capabilities,
      }

      lspconfig.marksman.setup {
        capabilities = capabilities,
      }

      lspconfig.docker_compose_language_service.setup {
        capabilities = capabilities,
      }

      lspconfig.dockerls.setup {
        capabilities = capabilities,
      }

      lspconfig.jsonls.setup {
        capabilities = capabilities,
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('go.mod', '.git', 'go.work'),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
          },
        },
      }

      lspconfig.hls.setup {
        --filetypes = { 'haskell', 'lhaskell', 'cabal' },
      }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  },
  {
    'mfussenegger/nvim-jdtls',
  },
}
