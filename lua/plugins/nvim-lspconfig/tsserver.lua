local function setup(config)
    local capabilities = config.capabilities

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        },
    }

    return vim.tbl_extend('force', config, {
        init_options = require('nvim-lsp-ts-utils').init_options,
        on_attach = function(client, bufnr)
            config.on_attach(client, bufnr)

            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            local ts_utils = require('nvim-lsp-ts-utils')

            ts_utils.setup({})
            ts_utils.setup_client(client)

            local wk = require('which-key')

            wk.register({
                l = {
                    name = 'LSP',
                    i = {
                        '<CMD>TSLspImportAll<CR>',
                        'Import',
                    },
                    o = {
                        '<CMD>TSLspOrganize<CR>',
                        'Organize',
                    },
                },
            }, {
                prefix = '<leader>',
            })
        end,
        capabilities = capabilities,
    })
end

return {
    setup = setup,
}
