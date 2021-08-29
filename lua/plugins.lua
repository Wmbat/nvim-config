return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
        "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-buffer", }
    }

end)
