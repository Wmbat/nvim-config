return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        opts = {},
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'nvim_lsp', keyword_length = 3 },
                    { name = 'luasnip',  keyword_length = 2 },
                    { name = 'buffer',   keyword_length = 3 },
                    { name = 'nvim_lua' },
                    { name = 'cmp_ai',   keyword_length = 3 },
                    { name = 'path' },
                },
                window = {
                    completion = cmp.config.window.bordered {
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    },
                    documentation = cmp.config.window.bordered {
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    },
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-j>'] = cmp.mapping.select_next_item(select_opts),

                    -- ['<C-N>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-P>'] = cmp.mapping.scroll_docs(4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    ['<C-l>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<C-h>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1

                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
            })
        end,
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    {
        "onsails/lspkind.nvim",
        config = function()
            local lspkind = require('lspkind')
            lspkind.init({
                mode = 'symbol_text',
                symbol_map = {
                    Text = '',
                    Method = 'ƒ',
                    Function = '',
                    Constructor = '',
                    Variable = '',
                    Class = '',
                    Interface = 'ﰮ',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '了',
                    Keyword = '',
                    Snippet = '﬌',
                    Color = '',
                    File = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = ''
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "stevearc/aerial.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "Bilal2453/luvit-meta",
        lazy = true
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        opts = {
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
            },
            layouts = {
                {
                    -- You can change the order of elements in the sidebar
                    elements = {
                        -- Provide as ID strings or tables with "id" and "size" keys
                        { id = "scopes",      size = 0.25, },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 00.25 },
                    },
                    size = 80,
                    position = "right", -- Can be "left", "right", "top", "bottom"
                },
                -- {
                --     elements = { "repl" },
                --     size = 10,
                --     position = "bottom", -- Can be "left", "right", "top", "bottom"
                -- }
            },
            floating = {
                max_height = nil,  -- These can be integers or a float between 0 and 1.
                max_width = nil,   -- Floats will be treated as percentage of your screen.
                border = "single", -- Border style. Can be "single", "double" or "rounded"
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = {
                indent = 1
            },
        },
    },
    { "ray-x/lsp_signature.nvim" },
    {
        "seblj/roslyn.nvim",
        ft = "cs, csproj, sln, xaml",
        opts = {

        },
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
    },
    {
        "TheLeoP/powershell.nvim",
        opts = {
            bundle_path = "C:\\Users\\hspehner\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services\\",
            settings = {
                powershell = {
                    codeFormatting = { Preset = 'OTBS' },
                },
            },
            init_options = {
                enableProfileLoading = false,
            },
        },
    },
    {
        "rmagatti/goto-preview",
        opts = {
            width = 120, -- Width of the floating window
            height = 15, -- Height of the floating window
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
            -- border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
            default_mappings = false, -- Bind default mappings
            debug = false, -- Print debug information
            opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
            resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
            post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
            post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
            -- references = { -- Configure the telescope UI for slowing the references cycling window.
            --     telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
            -- },
            -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
            focus_on_open = true,                                          -- Focus the floating window when opening it.
            dismiss_on_move = false,                                       -- Dismiss the floating window when moving the cursor.
            force_close = true,                                            -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
            bufhidden = "wipe",                                            -- the bufhidden option to set on the floating window. See :h bufhidden
            stack_floating_preview_windows = true,                         -- Whether to nest floating windows
            preview_window_title = { enable = true, position = "center" }, -- Whether to set the preview window title as the filename
        },
    },
}
