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
    null_ls.builtins.formatting.prettierd,

    -- Refactoring
    null_ls.builtins.code_actions.refactoring,
}

null_ls.config({ sources = sources, debug = true })
require('lspconfig')['null-ls'].setup({
    on_attach = on_attach,
})
