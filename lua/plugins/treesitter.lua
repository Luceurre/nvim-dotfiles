local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg',
        files = { 'src/parser.c', 'src/scanner.cc' },
        branch = 'main',
    },
}

require('nvim-treesitter.configs').setup({
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
    textobjects = {

        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['if'] = '@function.inner',
            },
        },
    },
})
