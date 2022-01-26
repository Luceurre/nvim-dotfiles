vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
    use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
    use({ 'nvim-treesitter/nvim-treesitter', config = "require('plugins/nvim-treesitter')" })
    use('christoomey/vim-tmux-navigator')
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
end)
