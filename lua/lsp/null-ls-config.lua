local null_ls = require('null-ls')

local on_attach = function()
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
end

local sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,

    -- Refactoring
     null_ls.builtins.code_actions.refactoring
}

null_ls.config({ sources = sources, debug = true })
require('lspconfig')['null-ls'].setup({
  on_attach = on_attach
})
