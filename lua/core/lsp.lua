local vue_language_server_path = vim.fn.stdpath 'data' ..
'/mason/packages/vue-language-server/node_modules/@vue/language-server'

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}
local vtsls_config = {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = tsserver_filetypes,
}

local vue_ls_config = {
    on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
            local ts_clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'ts_ls' }
            local vtsls_clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'vtsls' }
            local clients = {}

            vim.list_extend(clients, ts_clients)
            vim.list_extend(clients, vtsls_clients)

            if #clients == 0 then
                vim.notify('Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.',
                    vim.log.levels.ERROR)
                return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
                title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                command = 'typescript.tsserverRequest',
                arguments = {
                    command,
                    payload,
                },
            }, { bufnr = context.bufnr }, function(_, r)
                local response = r and r.body
                -- TODO: handle error or response nil here, e.g. logging
                -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
                local response_data = { { id, response } }

                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify('tsserver/response', response_data)
            end)
        end
    end,
}
-- nvim 0.11 or above
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable { 'vtsls', 'vue_ls' }
vim.lsp.enable { 'ruff' }
vim.lsp.enable { 'lua_ls', 'ltex', 'texlab', 'astro-ls', 'clangd', 'matlab-language-server', 'lemminx', 'vue_ls', 'vtsls' }
