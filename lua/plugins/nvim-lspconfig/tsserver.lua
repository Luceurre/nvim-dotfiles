local function setup(config)
    return vim.tbl_extend('force', config, {
        init_options = require('nvim-lsp-ts-utils').init_options,
        on_attach = function(client, bufnr)
            config.on_attach(client, bufnr)

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
                },
            }, {
                prefix = '<leader>',
            })
        end,
    })
end

return {
    setup = setup,
}
