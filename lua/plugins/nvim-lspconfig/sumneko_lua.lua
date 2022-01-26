local function setup(config)
    local luadev = require('lua-dev').setup({
        lspconfig = config,
        runtime_path = true,
    })

    return luadev
end

return {
    setup = setup,
}
