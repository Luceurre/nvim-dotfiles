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
            s = {
                '<CMD>lua require("lspsaga.signaturehelp").signature_help()<CR>',
                'Signature',
            },
        },
        K = {
            '<CMD>lua require("lspsaga.hover").render_hover_doc()<CR>',
            'Documentations',
        },
        ['<leader>'] = {
            l = {
                name = 'LSP',
                a = {
                    '<CMD>lua require("lspsaga.codeaction").code_action()<CR>',
                    'Actions',
                },
                u = {
                    "<CMD>lua require('lspsaga.provider').lsp_finder()<CR>",
                    'Usage',
                },
                r = {
                    "<CMD>lua require('lspsaga.rename').rename()<CR>",
                    'Rename',
                },
            },
            d = {
                s = {
                    '<CMD>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>',
                    'Show',
                },
            },
        },
    })
end

local function on_attach()
    setup_keymap_on_attach()

    vim.cmd([[
			augroup LspSignature
				autocmd!
				autocmd CursorMovedI * Lspsaga signature_help
			augroup end
		]])
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
