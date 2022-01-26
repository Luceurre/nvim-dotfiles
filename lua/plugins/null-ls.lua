local null_ls = require('null-ls')

local on_attach = function()
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
end

local sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,

    -- Python
    null_ls.builtins.diagnostics.pylama,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.djhtml,
    null_ls.builtins.formatting.isort,
}

null_ls.setup({ sources = sources, debug = true, on_attach = on_attach })
