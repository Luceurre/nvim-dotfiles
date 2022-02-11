local nvim_lsp = require('lspconfig')
local wk = require('which-key')

local function setup_keymap_on_attach()
    wk.register({
        g = {
            name = 'Goto',
            d = {
                '<CMD>lua vim.lsp.buf.definition()<CR>',
                'Definition',
            },
        },
        ['<leader>'] = {
            l = {
                name = 'LSP',
                a = {
                    '<CMD>lua vim.lsp.buf.code_action()<CR>',
                    'Actions',
                },
            },
        },
    })
end

local function on_attach()
    setup_keymap_on_attach()
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.sumneko_lua.setup(require('plugins/nvim-lspconfig/sumneko_lua').setup(config))

nvim_lsp.pyright.setup(require('plugins/nvim-lspconfig/pyright').setup(config))
nvim_lsp.pylsp.setup(require('plugins.nvim-lspconfig.pylsp').setup(config))

nvim_lsp.tsserver.setup(require('plugins/nvim-lspconfig/tsserver').setup(config))
nvim_lsp.tailwindcss.setup(require('plugins.nvim-lspconfig.tailwindcss').setup(config))
