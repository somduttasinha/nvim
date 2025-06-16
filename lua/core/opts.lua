vim.g.mapleader = ' '
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.textwidth = 80

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.opt.tabstop = 2 -- Sets 'tabstop' to 2 for buffer-local settings in Markdown files
        vim.opt.formatoptions:append 't'
        vim.opt.expandtab = true
    end,
})


