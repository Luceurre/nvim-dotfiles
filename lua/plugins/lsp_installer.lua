local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
        capabilities = capabilities,
    }

    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup({
            lspconfig = {
                on_attach = function()
                    require('lsp_signature').on_attach()
                end,
            },
        })
    end

    -- if server.name == 'jdtls' then
    --     opts = {
    --         capabilities = capabilities,
    --         on_attach = function(client)
    --             client.resolved_capabilities.document_formatting = false
    --             client.resolved_capabilities.document_range_formatting = false
    --             require('lsp_signature').on_attach()
    --         end,
    --     }
    -- end
    if server.name == 'pyright' then
        opts.settings = {
            python = {
                venvPath = '/home/pglandon/.cache/pypoetry/virtualenvs/pocket-kitchen-api-vKqzRVaT-py3.10/',
            },
        }
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            require('lsp_signature').on_attach()
        end
    end

    if server.name == 'jsonls' then
        opts.settings = {
            json = {
                schemas = require('nlspsettings.jsonls').get_default_schemas(),
            },
        }
    end

    if server.name == 'tsserver' then
        opts = require('lsp.tsserver')
    end

    server:setup(opts)
end)
