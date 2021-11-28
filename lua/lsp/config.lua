local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {}

    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup({})
    end

    if server.name == 'tsserver' then
        local on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            local ts_utils = require('nvim-lsp-ts-utils')

            ts_utils.setup({
                debug = true,
                disable_commands = false,
                enable_import_on_completion = true,

                -- import all
                import_all_timeout = 5000, -- ms
                -- lower numbers = higher priority
                import_all_priorities = {
                    same_file = 1, -- add to existing import statement
                    local_files = 2, -- git files or files with relative path markers
                    buffer_content = 3, -- loaded buffer content
                    buffers = 4, -- loaded buffer names
                },
                import_all_scan_buffers = 100,
                import_all_select_source = false,

                -- filter diagnostics
                filter_out_diagnostics_by_severity = {},
                filter_out_diagnostics_by_code = {},

                -- inlay hints
                auto_inlay_hints = true,
                inlay_hints_highlight = 'Comment',

                -- update imports on file move
                update_imports_on_move = true,
                require_confirmation_on_move = false,
                watch_dir = nil,
            })

            ts_utils.setup_client(client)

            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end

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

        opts = {
            init_options = require('nvim-lsp-ts-utils').init_options,
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end

    server:setup(opts)
end)
