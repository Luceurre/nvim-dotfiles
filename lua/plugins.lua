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
    use({ 'jose-elias-alvarez/null-ls.nvim', config = "require('plugins/null-ls')", requires = 'nvim-lua/plenary.nvim' })
end)
