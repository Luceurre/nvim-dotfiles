local null_ls = require('null-ls')

local on_attach = function()
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
end

local sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,

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

    -- Refactoring
    null_ls.builtins.code_actions.refactoring,

    -- Git
    null_ls.builtins.code_actions.gitsigns,

    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.djhtml,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.pylint,
}

null_ls.config({ sources = sources, debug = true })
require('lspconfig')['null-ls'].setup({
    on_attach = on_attach,
})
