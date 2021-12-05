require('lualine').setup({
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp', 'coc' } } },
        lualine_c = {
            'filename',
            '%{&ft == "toggleterm" ? "terminal (".b:toggle_number.")" : ""}',
            'require("auto-session-library").current_session_name()',
        },

        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
})
