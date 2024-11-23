return {
    { -- For viewing diffs in neovim
        "sindrets/diffview.nvim",
        opts = {
            diff_binaries = false,    -- Show diffs for binaries
            enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
            git_cmd = { "git" },      -- The git executable followed by default args.
            hg_cmd = { "hg" },        -- The hg executable followed by default args.
            use_icons = true,         -- Requires nvim-web-devicons
            show_help_hints = true,   -- Show hints for how to open the help panel
            watch_index = true,       -- Update views and index buffers when the git index changes.
            icons = {                 -- Only applies when use_icons is true.
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
            },
            view = {
                -- Configure the layout and behavior of different types of views.
                -- Available layouts:
                --  'diff1_plain'
                --    |'diff2_horizontal'
                --    |'diff2_vertical'
                --    |'diff3_horizontal'
                --    |'diff3_vertical'
                --    |'diff3_mixed'
                --    |'diff4_mixed'
                -- For more info, see |diffview-config-view.x.layout|.
                default = {
                    -- Config for changed files, and staged files in diff views.
                    layout = "diff2_horizontal",
                    disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
                    winbar_info = false,         -- See |diffview-config-view.x.winbar_info|
                },
                merge_tool = {
                    -- Config for conflicted files in diff views during a merge or rebase.
                    layout = "diff3_mixed",
                    disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
                    winbar_info = true,         -- See |diffview-config-view.x.winbar_info|
                },
                file_history = {
                    -- Config for changed files in file history views.
                    layout = "diff2_horizontal",
                    disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
                    winbar_info = false,         -- See |diffview-config-view.x.winbar_info|
                },
            },
            file_panel = {
                listing_style = "tree",              -- One of 'list' or 'tree'
                tree_options = {                     -- Only applies when listing_style is 'tree'
                    flatten_dirs = true,             -- Flatten dirs that only contain one single dir
                    folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
                },
                win_config = {                       -- See |diffview-config-win_config|
                    position = "left",
                    width = 35,
                    win_opts = {},
                },
            },
            file_history_panel = {
                log_options = { -- See |diffview-config-log_options|
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                    hg = {
                        single_file = {},
                        multi_file = {},
                    },
                },
                win_config = { -- See |diffview-config-win_config|
                    position = "bottom",
                    height = 16,
                    win_opts = {},
                },
            },
            commit_log_panel = {
                win_config = {}, -- See |diffview-config-win_config|
            },
            default_args = {     -- Default args prepended to the arg-list for the listed commands
                DiffviewOpen = {},
                DiffviewFileHistory = {},
            },
        },
    },
    { -- For viewing git changes in neovim
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged                 = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable          = true,
            signcolumn                   = true,
            numhl                        = true,
            linehl                       = false,
            word_diff                    = false,
            watch_gitdir                 = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = true,
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
                delay = 500,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil, -- Use default
            max_file_length              = 40000,
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },

            on_attach                    = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']j', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']j', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', ']k', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']k', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('n', '<leader>hS', gitsigns.stage_buffer)
                map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                map('n', '<leader>hR', gitsigns.reset_buffer)
                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>hd', gitsigns.diffthis)
                map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                map('n', '<leader>td', gitsigns.toggle_deleted)
                map('n', '<leader>twd', gitsigns.toggle_word_diff)
            end
        }
    }
}
