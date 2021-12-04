-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/pglandon/.local/lsp/jdtls/workspaces/' .. project_name

local bundles = {
    vim.fn.glob(
        '/home/pglandon/.local/dap/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'
    ),
}
vim.list_extend(bundles, vim.split(vim.fn.glob('/home/pglandon/.local/dap/java/vscode-java-test/server/*.jar'), '\n'))
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = { '/home/pglandon/.config/nvim/ftplugin/start_jdtls.sh' },
    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml' }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    java = {
        configuration = {
            runtimes = {
                {
                    name = 'JavaSE-11',
                    path = '/usr/lib/jvm/java-11-openjdk/',
                },
                {
                    name = 'JavaSE-17',
                    path = '/usr/lib/jvm/java-17-openjdk/',
                },
            },
        },
    },
    ['init_options'] = {
        bundles = bundles,
    },
    on_attach = function(client, bufnr)
        -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
        -- you make during a debug session immediately.
        -- Remove the option if you do not want that.
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
