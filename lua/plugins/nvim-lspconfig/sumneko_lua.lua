local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local luadev = require('lua-dev').setup({
    lspconfig = {
        capabilities = capabilities,
    },
})

return luadev
