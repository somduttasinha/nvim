local P = {}
keymaps = P

vim.g.mapleader = ' '

-- keymaps --
local key_map = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end
-- Function to map keys for Java projects with Gradle and Maven wrappers
function P.map_java_keys(bufnr)
    key_map('n', '<leader>grc', [[:!./gradlew compileJava<CR>]])
end

return P

