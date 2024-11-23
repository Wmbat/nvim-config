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
    use {
        'HiPhish/nvim-ts-rainbow2',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        },
    }

    -- Utility
    --
    use 'windwp/nvim-autopairs'
    use 'nvim-lua/popup.nvim'
    use 'norcalli/nvim_utils'
    use 'matze/vim-move'
    use 'mhinz/vim-startify'
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    }
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
    use 'folke/neodev.nvim'
    use 'folke/zen-mode.nvim'
    use 'rmagatti/goto-preview'
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- Terminal
    --
    use 'akinsho/toggleterm.nvim'

    -- Debugging
    --
    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' }
    }

    -- LSP automatic install
    --
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

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

    use { 'ray-x/lsp_signature.nvim' }
    use { 'RRethy/vim-illuminate' }

    -- Analytics
    --
    -- use 'wakatime/vim-wakatime'
    use 'andweeb/presence.nvim'

    use {
        'MeanderingProgrammer/render-markdown.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
end)
