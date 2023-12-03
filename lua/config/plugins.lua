return require('packer').startup(function()
    -- Packer can manage itself
    --
    use 'wbthomason/packer.nvim'

    -- Theming
    --
    use {
        'wmbat/wmbat-dark',
        requires = 'rktjmp/lush.nvim'
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Utility
    --
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
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'stevearc/dressing.nvim'
    }

    -- Terminal
    --
    use 'akinsho/toggleterm.nvim'

    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' }
    }

    -- LSP automatic install
    --
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'mfussenegger/nvim-lint' }

    use { 'neovim/nvim-lspconfig' }

    -- Autocompletion
    --
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }

    -- Snippets
    --
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    -- LSP symbols
    --
    use { 'onsails/lspkind.nvim' }

    -- Syntax Highlighting
    --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'Badhi/nvim-treesitter-cpp-tools',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use { 'stevearc/aerial.nvim' }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use { 'ray-x/lsp_signature.nvim' }
    use { 'RRethy/vim-illuminate' }

    -- Markdown
    --
    use 'iamcco/markdown-preview.nvim'

    -- Analytics
    --
    -- use 'wakatime/vim-wakatime'
    use 'andweeb/presence.nvim'
end)
