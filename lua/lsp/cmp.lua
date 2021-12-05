local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                ultisnips = '[UltiSnip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Latex]',
                rg = '[Rg]',
                path = '[Path]',
            },
        }),
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
        -- { name = 'rg' },
    }),
    native_menu = false,
})

cmp.setup.cmdline('/', {
    sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
    },
})
