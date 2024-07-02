return {
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function()
      require('gopher').setup{
                commands = {
                    iferr = "~/go/bin/iferr",
                }
            }

        vim.keymap.set('n', '<leader>gsj', ':GoTagAdd json<CR>', {})
        vim.keymap.set('n', '<leader>gsy', ':GoTagAdd yaml<CR>', {})
        vim.keymap.set('n', '<leader>gie', ':GoIfErr<CR>', {})

    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
