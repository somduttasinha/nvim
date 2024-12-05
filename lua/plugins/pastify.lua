--return {
--    'TobinPalmer/pastify.nvim',
--    config = function()
--        require('pastify').setup {
--            opts = {},
--        }
--    end,
--}
return {
  'pastify.nvim',
  dir = '~/projects/nvim-plugins/pastify.nvim',
  config = function()
    require('pastify').setup {
      opts = {},
    }
    vim.keymap.set('n', '<leader>p', ':Pastify<CR>', { noremap = true, silent = true })
  end,
}
