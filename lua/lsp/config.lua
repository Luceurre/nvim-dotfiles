local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
        capabilities = capabilities,
    }

    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup({
        })
    end
    server:setup(opts)
end)
