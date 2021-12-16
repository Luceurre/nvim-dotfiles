return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = "require('plugins.treesitter')",
        run = ':TSUpdate',
    })
    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } })
    use({ 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } })
    use({ 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } })
    use('windwp/nvim-ts-autotag')
    use({ 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' })

    -- LSP
    use('neovim/nvim-lspconfig')
    use({ 'williamboman/nvim-lsp-installer', config = "require('plugins.lsp_installer')" })
    use('folke/lua-dev.nvim')
    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
        config = "require('lsp.null-ls')",
    })
    use('folke/lsp-colors.nvim')
    use({ 'tami5/lspsaga.nvim', config = "require('plugins.saga')" })
    use('mfussenegger/nvim-jdtls')
    use('mfussenegger/nvim-dap')
    use('simrat39/symbols-outline.nvim')
    use({
        'tamago324/nlsp-settings.nvim',
        config = function()
            require('nlspsettings').setup()
        end,
    })
    use({
        'ldelossa/calltree.nvim',
        config = function()
            require('calltree').setup({})
        end,
    })
    use({
        'code-biscuits/nvim-biscuits',
        config = function()
            require('nvim-biscuits').setup({
                default_config = {
                    max_length = 1,
                    min_distance = 5,
                    prefix_string = ' ✨ ',
                },
                trim_by_words = true,
                max_length = 2,
            })
        end,
    })
    use({
        'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup({
                enable = false,
            })
        end,
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = "require('plugins.telescope')",
    })
    use({ 'gbrlsnchs/telescope-lsp-handlers.nvim' })
    use({ 'nvim-telescope/telescope-ui-select.nvim' })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use({
        'AckslD/nvim-neoclip.lua',
        config = function()
            require('neoclip').setup({
                enable_persistant_history = true,
            })
        end,
        requires = { 'tami5/sqlite.lua', module = 'sqlite' },
    })
    use({
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
    })
    use('nvim-telescope/telescope-dap.nvim')
    use('fhill2/telescope-ultisnips.nvim')
    use({
        'rmagatti/session-lens',
        requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
        config = function()
            require('session-lens').setup({})
        end,
    })

    -- Completion
    use('onsails/lspkind-nvim')
    use({
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = "require('plugins.cmp')",
    })
    use({ 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lua', requires = 'hrsh7th/nvim-cmp', after = { 'nvim-cmp' } })
    use({ 'ray-x/lsp_signature.nvim', config = "require('plugins.lsp_signature')" })
    use({ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' })
    use({ 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })

    -- Refactoring
    use({
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
        },
    })

    -- Neorg
    use({
        'nvim-neorg/neorg',
        config = "require('plugins.neorg')",
        requires = 'nvim-lua/plenary.nvim',
    })

    -- Theme
    use('drewtempelmeyer/palenight.vim')
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = "require('plugins.lualine')",
    })
    use('folke/tokyonight.nvim')

    -- Snippets
    use('SirVer/ultisnips')
    use('honza/vim-snippets')

    -- Diagnostic
    use({
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = "require('plugins.trouble')",
    })

    -- Keymaps
    use({
        'folke/which-key.nvim',
        config = "require('plugins.which-key')",
    })

    -- Utils
    use({ 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" })
    use({
        'blackCauldron7/surround.nvim',
        config = function()
            require('surround').setup({ mappings_style = 'surround' })
        end,
    })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = 'ccc',
                },
                opleader = {
                    line = 'cc',
                },
            })
        end,
    })
    use({
        'windwp/nvim-spectre',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('spectre').setup({
                live_update = false,
            })
        end,
    })
    use('wellle/targets.vim')
    use({ 'monaqa/dial.nvim', config = "require('plugins.dial')" })
    use('junegunn/fzf.vim')
    use('mizlan/iswap.nvim')
    use({
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup({
                tabkey = '', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' },
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {}, -- tabout will ignore these filetypes
            })
        end,
        after = 'nvim-cmp',
    })
    use({
        'luukvbaal/stabilize.nvim',
        config = function()
            require('stabilize').setup()
        end,
    })
    use({ 'AndrewRadev/splitjoin.vim' })
    use({ 'tpope/vim-repeat' })
    use({ 'mg979/vim-visual-multi' })
    use({
        'folke/twilight.nvim',
        config = function()
            require('twilight').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    --- Typescript
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'nvim-lua/plenary.nvim' } })

    -- Git
    use({
        'f-person/git-blame.nvim',
        config = function()
            vim.cmd("let g:gitblame_date_format = '%r'")
        end,
    })
    use({
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        config = "require('plugins.gitsigns')",
    })
    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.neogit')" })
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.diffview')" })
    use('andymass/vim-matchup')

    -- Motion
    use({
        'phaazon/hop.nvim',
        config = function()
            require('hop').setup()
        end,
    })
    use('ggandor/lightspeed.nvim')
    use('mfussenegger/nvim-ts-hint-textobject')
    use({ 'kevinhwang91/nvim-hlslens' })

    -- Extra
    use({
        'glacambre/firenvim',
        run = function()
            vim.fn['firenvim#install'](0)
        end,
    })
    use('glepnir/dashboard-nvim')
    use({
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup({})
        end,
    })

    -- CHADTree
    use({ 'ms-jpq/chadtree', branch = 'chad' })

    -- Tabs
    use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup({})
        end,
    })

    -- Tests
    use({
        'rcarriga/vim-ultest',
        requires = { 'vim-test/vim-test' },
        run = ':UpdateRemotePlugins',
        config = function()
            vim.cmd('let g:ultest_use_pty = 1')
        end,
    })

    -- Terminal and REPL
    use({ 'akinsho/toggleterm.nvim', config = "require('plugins.toggleterm')" })
    use({ 'michaelb/sniprun', run = 'bash ./install.sh' })
    use('pianocomposer321/yabs.nvim')
end)
