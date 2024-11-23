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
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'hyper',            --  theme is doom and hyper default is hyper

                disable_move = false,       --  default is false disable move keymap for hyper
                shortcut_type = 'number',   --  shorcut type 'letter' or 'number'
                shuffle_letter = false,     --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
                change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
                config = {                  --  config used for theme
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' Apps',
                            group = 'DiagnosticHint',
                            action = 'Telescope app',
                            key = 'a',
                        },
                        {
                            desc = ' dotfiles',
                            group = 'Number',
                            action = 'Telescope dotfiles',
                            key = 'd',
                        },
                    },
                },
                hide = {
                    statusline = true, -- hide statusline default is true
                    tabline = true,    -- hide the tabline
                    winbar = true,     -- hide winbar
                },
            })
        end,
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
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
    use {
        'stevearc/aerial.nvim',
    }
    use {
        'sindrets/diffview.nvim'
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

    use {
        'seblj/roslyn.nvim',
        ft = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets', 'xaml' },
    }

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
