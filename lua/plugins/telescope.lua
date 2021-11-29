local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ['<c-t>'] = trouble.open_with_trouble },
            n = { ['<c-t>'] = trouble.open_with_trouble },
        },
    },
    extensions = {
        lsp_handlers = {
            disable = {
                ['textDocument/codeAction'] = true,
            },
            location = {
                telescope = {},
                no_results_message = 'No references found',
            },
            symbol = {
                telescope = {},
                no_results_message = 'No symbols found',
            },
            call_hierarchy = {
                telescope = {},
                no_results_message = 'No calls found',
            },
            code_action = {
                telescope = {},
                no_results_message = 'No code actions available',
                prefix = '',
            },
        },
    },
})
telescope.load_extension('ui-select')
telescope.load_extension('lsp_handlers')
