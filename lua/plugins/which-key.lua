local wk = require('which-key')
wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = 'Comments' },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = 'none', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = 'auto', -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'k' },
        v = { 'j', 'k' },
    },
})

wk.register({
    p = {
        name = 'Project',
        f = { '<cmd>SearchSession<CR>', 'Find' },
    },
    f = {
        name = 'File',
        f = { '<cmd>Telescope find_files<cr>', 'Find' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Recent' },
        g = { '<cmd>Telescope git_files<cr>', 'Git' },
        t = { '<cmd>CHADopen<cr>', 'Tree' },
    },
    w = {
        name = 'Window',
        s = { '<C-w>s<C-w>j', 'Split' },
        v = { '<C-w>v<C-w>l', 'Split Vertically' },
        j = { '<C-w>j', 'Select below' },
        k = { '<C-w>k', 'Select above' },
        h = { '<C-w>h', 'Select left' },
        l = { '<C-w>l', 'Select right' },
        d = { '<C-w>q', 'Kill' },
        ['<Tab>'] = { '<C-w>w', 'Switch' },
    },
    g = {
        name = 'Goto',
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
        r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
        D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
        i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type' },
    },
    d = {
        name = 'Diagnostics',
        n = { '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next' },
        p = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Prev' },
    },
    c = {
        name = 'Code',
        a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Action' },
    },
    H = {
        name = 'Hunk',
        s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage' },
        u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Undo' },
        r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset' },
        p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview' },
    },
    b = {
        name = 'Buffer',
        s = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', 'Stage' },
        r = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset' },
        f = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Find' },
    },
    v = {
        name = 'Version',
        n = { '<cmd>Neogit<CR>', 'Neogit' },
        l = { '<cmd>lua _lazygit_toggle()<CR>', 'Lazygit' },
        c = { '<cmd>lua require"telescope.builtin".git_commits()<CR>', 'Commits' },
        b = { '<cmd>lua require"telescope.builtin".git_branches()<CR>', 'Branches' },
        d = { '<cmd>lua require"telescope.builtin".git_bcommits()<CR>', 'Diff' },
        s = { '<cmd>lua require"telescope.builtin".git_status()<CR>', 'Status' },
    },
    o = {
        name = 'Open',
        t = { '<Cmd>exe v:count1 . "ToggleTerm"<CR>', 'Terminal' },
    },
    s = {
        name = 'Search',
        r = {
            '<cmd>lua require("spectre").open()<CR>',
            'Replace',
        },
        f = {
            '<cmd>lua require("spectre").open_file_search()',
            'File',
        },
        h = {
            '<cmd>lua require"telescope.builtin".pickers()<CR>',
            'History',
        },
        g = {
            '<cmd>lua require"telescope.builtin".live_grep()<CR>',
            'Grep',
        },
        s = { '<cmd>lua require"telescope.builtin".treesitter()<CR>', 'Symbol' },
        p = { '<cmd>lua require"telescope.builtin".builtin()<CR>', 'Picker' },
        c = { '<cmd>lua require("telescope").extensions.neoclip.default()<CR>', 'Clipboard' },
    },
    h = {
        name = 'Help',
        c = { '<cmd>lua require"telescope.builtin".commands()<CR>', 'Command List' },
        m = { '<cmd>lua require"telescope.builtin".man_pages()<CR>', 'Man pages' },
        k = { '<cmd>lua require"telescope.builtin".keymaps()<CR>', 'Keymaps' },
    },
    t = {
        name = 'Test',
        n = {
            '<Plu>(ultest-next-fail)',
            'Next',
        },
        p = {
            '<Plug>(ultest-prev-fail)',
            'Previous',
        },
        f = {
            '<Plug>(ultest-run-file)',
            'File',
        },
        c = {
            '<Plug>(ultest-run-nearest)',
            'Under cursor',
        },
        l = {
            '<Plug>(ultest-run-last)',
            'Last',
        },
        s = {
            '<Plug>(ultest-summary-toggle)',
            'Summary',
        },
        j = {
            '<Plug>(ultest-output-jump)',
            'Jump',
        },
        d = {
            '<Plug>(ultest-debug-nearest)',
            'Debug',
        },
    },
    m = {
        name = 'Misc',
        b = {
            '<Cmd>DialIncrement custom#boolean<CR>',
            'Boolean',
        },
    },
    D = {
        name = 'Debug',
        B = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', 'Breakpoints' },
        C = { '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', 'Configurations' },
        c = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', 'Commands' },
        v = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', 'Variables' },
        f = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', 'Frames' },
    },
    i = {
        name = 'Insert',
        s = { "<CMD>lua require'telescope'.extensions.ultisnips.ultisnips{}<CR>", 'Snippet' },
    },
}, {
    prefix = '<leader>',
})

wk.register({
    g = {
        name = 'Goto',
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
        r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
        D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
        i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type' },
        p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", 'Peek' },
        w = { '<cmd>HopWord<CR>', 'Word' },
        l = { '<cmd>HopLineStart<CR>', 'Line' },
    },
    K = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", 'Hover' },
    ['<C-k>'] = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", 'Signature' },
    ['<a-cr>'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    f = {
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
        '1-Char Backward',
    },
    F = {
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
        '1-Char Foward',
    },
    -- s = {
    --     '<cmd>HopChar2<CR>',
    --     'Snipe',
    -- },
})
-- TODO: add those to which-key
vim.api.nvim_set_keymap(
    'o',
    'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    'o',
    'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    '',
    'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    '',
    'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.api.nvim_set_keymap('v', 'z', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('v', 'Z', '<Plug>Lightspeed_S', {})
vim.cmd([[
omap     <silent> gn :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> gn :lua require('tsht').nodes()<CR>
]])
vim.cmd([[
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
" use : instead of <Cmd>
nnoremap <silent> <leader>l :noh<CR>
]])

-- Disable arrow keys in operation, motion, normal and visual modes
vim.cmd([[
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
]])
