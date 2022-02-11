local function setup(config)
    return vim.tbl_extend('error', config, {
        settings = {
            python = {
                venvPath = '/home/pglandon/.cache/pypoetry/virtualenvs',
                analysis = {
                    diagnosticMode = 'workspace',
                    typeCheckingMode = 'off',
                    useLibraryCodeForTypes = true,
                },
                pyright = {
                    disableOrganizeImports = true,
                },
            },
        },
    })
end

return {
    setup = setup,
}
