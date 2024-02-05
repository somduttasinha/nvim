local P = {}
keymaps = P

vim.g.mapleader = ' '

-- keymaps --
local key_map = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end
-- Function to map keys for Java projects with Gradle and Maven wrappers
--  template:
--  nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
-- nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
-- vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
-- nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
-- vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
-- vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>


-- " If using nvim-dap
-- " This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
-- nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
-- nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>


function P.map_java_keys(bufnr)
    key_map('n', '<leader>grc', [[:!./gradlew compileJava<CR>]])
    key_map('n', '<leader>df', [[:lua require'jdtls'.test_class()<CR>]])
    key_map('n', '<leader>dn', [[:lua require'jdtls'.test_nearest_method()<CR>]])
    key_map('n', '<leader>o', [[:lua require'jdtls'.organize_imports()<CR>]])
end

return P
