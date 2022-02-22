local function setup(config)
    return vim.tbl_extend('force', config, {
        on_attach = function(client, bufnr)
            config.on_attach(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,
    })
end

return {
    setup = setup,
}
