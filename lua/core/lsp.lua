local mason_registry = require 'mason-registry'

local lombok_jar = mason_registry.get_package('jdtls'):get_install_path() .. '/lombok.jar'
local jdtls_cmd = { vim.fn.exepath 'jdtls' }

-- Inject the lombok javaagent
table.insert(jdtls_cmd, string.format('--jvm-arg=-javaagent:%s', lombok_jar))

vim.lsp.config['jdtls'] = {
    cmd = jdtls_cmd,
}
vim.lsp.enable { 'lua_ls', 'jdtls', 'gopls', 'ltex', 'texlab', 'astro-ls', 'clangd', 'matlab-language-server', 'lemminx' }
