vim.g.mapleader = ' '
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.textwidth = 80

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.tabstop = 2 -- Sets 'tabstop' to 2 for buffer-local settings in Markdown files
    vim.opt.formatoptions:append 't'
    vim.opt.expandtab = true
  end,
})

vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ww', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', '<C-w>q', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':wa<CR>', { noremap = true, silent = true })

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require('lazy').setup 'plugins'

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>i', function ()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}), {0})
end)

vim.api.nvim_exec(
  [[
  augroup AutoRunGf
    autocmd!
    autocmd BufWritePost * execute 'normal! \<leader>gf'
  augroup END
]],
  false
)
