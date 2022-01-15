local wk = require('which-key')
local colemak_mode = false

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
    map('n', lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
    map('v', lhs, rhs, opts)
end

local function omap(lhs, rhs, opts)
    map('o', lhs, rhs, opts)
end

local function setup_colemak()
    print('Colemak layout')

    local mappers = { nmap, vmap, omap }

    for _, mapper in ipairs(mappers) do
        mapper('n', 'h')
        mapper('e', 'j')
        mapper('i', 'k')
        mapper('o', 'l')
        mapper('u', 'i')
        mapper('f', 'e')
        mapper('t', 'f')
        mapper('y', 'o')
        mapper('j', 'y')
        mapper('l', 'u')
        mapper('s', 'd')
        mapper(';', 'p')
    end

    colemak_mode = true
end

local function setup_qwerty()
    print('Qwerty layout')

    local letters = 'qwertyuiopasdfghjklzxcvbn'

    for char in letters:gmatch('.') do
        nmap(char, char)
        vmap(char, char)
        omap(char, char)
    end

    colemak_mode = false
end

local function switch_mode()
    if colemak_mode then
        setup_qwerty()
        return
    end

    setup_colemak()
end

local function setup(options)
    nmap('<SPACE>', '<Nop>')

    wk.register({
        T = {
            name = 'Toggle',
            l = { switch_mode, 'Layout' },
        },
    }, {
        prefix = '<leader>',
    })

    if options.colemak_mode == true then
        setup_colemak()
        return
    end
    setup_qwerty()
end

return {
    setup = setup,
    colemak_mode = colemak_mode,
}
