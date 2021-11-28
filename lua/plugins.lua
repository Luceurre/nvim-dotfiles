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

    use('p00f/nvim-ts-rainbow')
    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } })

    -- LSP
    use('neovim/nvim-lspconfig')
    use({ 'williamboman/nvim-lsp-installer', config = "require('lsp.config')" })
    use('folke/lua-dev.nvim')
    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
        config = "require('lsp.null-ls-config')",
    })
    use('folke/lsp-colors.nvim')

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = "require('plugins.telescope')",
    })

    -- Completion
    use('onsails/lspkind-nvim')
    use({ 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('lsp.cmp')" })
    use({ 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lua', requires = 'hrsh7th/nvim-cmp', after = { 'nvim-cmp' } })

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
        config = function()
            require('lualine').setup()
        end,
    })

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
end)
