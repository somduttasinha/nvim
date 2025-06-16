vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':wa<CR>', { noremap = true, silent = true })

-- Yank into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- yank motion
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d') -- delete motion
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p') -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P') -- paste before cursor


