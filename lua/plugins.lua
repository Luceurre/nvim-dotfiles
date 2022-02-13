return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('folke/tokyonight.nvim')

    use({ 'neovim/nvim-lspconfig', config = "require('plugins/nvim-lspconfig')" })
    use('folke/lua-dev.nvim')
    use({ 'folke/which-key.nvim', config = "require('plugins/which-key')" })

    use({ 'SirVer/ultisnips', config = "require('plugins/ultisnips')" })
    use('hrsh7th/cmp-nvim-lsp')
    use({ 'hrsh7th/nvim-cmp', config = "require('plugins/nvim-cmp')" })
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = "require('plugins/null-ls')",
        requires = 'nvim-lua/plenary.nvim',
    })
    use({ 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = "require('plugins/trouble')" })
    use({ 'windwp/nvim-autopairs', config = "require('plugins/nvim-autopairs')" })
    use({
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = "require('plugins/telescope')",
    })
    use({ 'nvim-treesitter/nvim-treesitter', config = "require('plugins/nvim-treesitter')" })
    use('christoomey/vim-tmux-navigator')
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
    use('mechatroner/rainbow_csv')
    use('kmonad/kmonad-vim')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use({ 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' })
    use('ryanoasis/vim-devicons')
    use({ 'phaazon/hop.nvim', config = "require('plugins.hop')" })
    use({ 'windwp/nvim-ts-autotag', config = "require('plugins.nvim-ts-autotag')" })
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use({ 'tami5/lspsaga.nvim' })
end)
