local null_ls = require('null-ls')

local on_attach = function()
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
end

local sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,

    -- Python
    null_ls.builtins.diagnostics.pylama.with({
        only_local = '.venv/bin',
        extra_args = { '-l', '"pylint"' },
    }),

    -- Typescript
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd.with({
        filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
            'css',
            'scss',
            'less',
            'html',
            'json',
            'yaml',
            'markdown',
            'graphql',
            'java',
        },
    }),
}

null_ls.setup({ sources = sources, debug = true, on_attach = on_attach })
