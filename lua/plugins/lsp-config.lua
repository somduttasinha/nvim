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
        ensure_installed = { 'lua_ls', 'jdtls', 'pyright', 'ltex', 'texlab' },
      }
    end,
  },
  {
    'b0o/schemastore.nvim',
  },
  {
    'nvim-java/nvim-java',
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

      lspconfig.solidity.setup {
        -- on_attach = on_attach, -- probably you will need this.
        -- capabilities = capabilities,
        settings = {
          -- example of global remapping
          solidity = {
            includePath = '',
            remapping = { ['@OpenZeppelin/'] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' },
            -- Array of paths to pass as --allow-paths to solc
            allowPaths = {},
          },
        },
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
      lspconfig.astro.setup {
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

      lspconfig.bashls.setup {
        capabilities = capabilities,
      }

      lspconfig.clangd.setup {
        capabilities = capabilities,
        init_options = {
          fallbackFlags = { '-std=c++20' },
        },
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
      lspconfig.gradle_ls.setup {
        capabilities = capabilities,
      }
      local java = require 'java'

      java.setup()

      --lspconfig.jdtls.setup {
      --  capabilities = capabilities,
      --  on_attach = function(client, bufnr)
      --    vim.keymap.set('n', '<leader>tl', function()
      --      java.runner.built_in.toggle_logs()
      --    end, opts)

      --    vim.keymap.set('n', '<leader>tc', function()
      --      java.test.run_current_class()
      --    end, opts)

      --    vim.keymap.set('n', '<leader>tr', function()
      --      java.test.view_last_report()
      --    end, opts)

      --    vim.keymap.set('n', '<leader>dc', function()
      --      java.test.debug_current_class()
      --    end, opts)

      --    vim.keymap.set('n', '<leader>rm', function()
      --      java.runner.built_in.run_app {}
      --    end, opts)
      --  end,
      --}

      lspconfig.gradle_ls.setup {
        capabilities = capabilities,
      }

      lspconfig.ltex.setup {
        capabilities = capabilities,
        settings = {
          ltex = {
            language = 'en-GB',
          },
        },
      }

      lspconfig.texlab.setup {}

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
