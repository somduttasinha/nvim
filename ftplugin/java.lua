-- Java Language Server configuration.org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar
-- Locations:
-- 'nvim/ftplugin/java.lua'.
-- 'nvim/lang-servers/intellij-java-google-style.xml'

local jdtls_ok, jdtls = pcall(require, 'jdtls')
if not jdtls_ok then
    vim.notify 'JDTLS not found, install with `:LspInstall jdtls`'
    return
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'
local path_to_lsp_server = jdtls_path .. '/config_mac'
local path_to_plugins = jdtls_path .. '/plugins/'
local path_to_jar = path_to_plugins .. 'org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar'
local lombok_path = jdtls_path .. '/lombok.jar'
local path_to_java_dap = '/Users/somsinha/.config/nvim/java-debug/'

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath 'data' .. '/site/java/workspace-root/' .. project_name
os.execute('mkdir ' .. workspace_dir)
local mason_registry = require 'mason-registry'

-- Main Config
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        '/home/som/.sdkman/candidates/java/17.0.11-amzn/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_path,
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        '-jar',
        path_to_jar,
        '-configuration',
        path_to_lsp_server,
        '-data',
        workspace_dir,
    },

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            home = '/home/som/.sdkman/candidates/java/17.0.11-amzn',
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = 'interactive',
                runtimes = {
                    {
                        name = 'JavaSE-17',
                        path = '/home/som/.sdkman/candidates/java/17.0.11-amzn',
                    },
                    {
                        name = 'JavaSE-11',
                        path = '/home/som/.sdkman/candidates/java/11.0.23-zulu',
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
        },
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                'org.hamcrest.MatcherAssert.assertThat',
                'org.hamcrest.Matchers.*',
                'org.hamcrest.CoreMatchers.*',
                'org.junit.jupiter.api.Assertions.*',
                'java.util.Objects.requireNonNull',
                'java.util.Objects.requireNonNullElse',
                'org.mockito.Mockito.*',
            },
            importOrder = {
                'java',
                'javax',
                'com',
                'org',
            },
        },
        extendedClientCapabilities = extendedClientCapabilities,
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
}

local bundles = {
    vim.fn.glob(mason_registry.get_package('java-debug-adapter'):get_install_path() ..
    '/extension/server/com.microsoft.java.debug.plugin-*.jar'),
}

vim.list_extend(bundles,
    vim.split(vim.fn.glob(mason_registry.get_package('java-test'):get_install_path() .. '/extension/server/*.jar'), '\n'))

config['init_options'] = {
    bundles = bundles,
}

config['on_attach'] = function(client, bufnr)
    require('keymaps').map_java_keys(bufnr)
    require('jdtls').setup_dap { hotcodereplace = 'auto' }
    local dap = require 'dap'

    dap.configurations.java = dap.configurations.java or {}
    table.insert(dap.configurations.java, {
        type = 'java',
        request = 'launch',
        name = 'Debug (Launch) with Preview',
        mainClass = '${file}',
        projectName = '${workspaceFolder}',
        vmArgs = '--enable-preview',
    })

    table.insert(dap.configurations.java, {
        -- You need to extend the classPath to list your dependencies.
        -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
        classPaths = {},

        -- If using multi-module projects, remove otherwise.
        javaExec = '/home/som/.sdkman/candidates/java/17.0.11-amzn/bin/java',

        -- If using the JDK9+ module system, this needs to be extended
        -- `nvim-jdtls` would automatically populate this property
        modulePaths = {},
        name = 'Launch YourClassName',
        request = 'launch',
        type = 'java',
    })

    require('jdtls.dap').setup_dap_main_class_configs()
    vim.lsp.codelens.refresh()
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)
--
jdtls.start_or_attach(config)
--require('jdtls').setup(config)
