return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theming
    use 'sainnhe/edge'
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'ap/vim-css-color'
    use 'kyazdani42/nvim-web-devicons'

    -- Zen
    use 'Pocco81/TrueZen.nvim'

    -- Utility
    use 'nvim-lua/popup.nvim'
    use 'norcalli/nvim_utils'
    use 'matze/vim-move'
    use 'mhinz/vim-startify'
    use 'Konfekt/FastFold'
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { 
        'vhyrro/neorg',
        branch = 'unstable',
        requires = 'nvim-lua/plenary.nvim',
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- LSP
    use 'neoclide/coc.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- C++ 
    use 'rhysd/vim-clang-format'

    -- Markdown
    use 'iamcco/markdown-preview.nvim'

    -- Analytics
    use 'wakatime/vim-wakatime'
    use 'andweeb/presence.nvim'

end)
