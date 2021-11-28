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
                ['af'] = '@function.outer',
                ['ac'] = '@call.outer',
                ['ic'] = '@call.inner',
                ['aob'] = '@block.outer',
                ['iob'] = '@block.inner',
                ['aop'] = '@parameter.outer',
                ['iop'] = '@parameter.inner',
                ['aoc'] = '@class.outer',
                ['ioc'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
    textsubjects = {
        enable = true,
        keymaps = {
            [';'] = 'textsubjects-smart',
            ["'"] = 'textsubjects-container-outer',
        },
    },
    autotag = {
        enable = true,
    },
})
