return {
    { -- A comfy buffer line
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = "none",
                close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '● ',
                close_icon = ' ',
                left_trunc_marker = ' ',
                right_trunc_marker = ' ',

                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true,  -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true,   -- use nvim's diagnostic handler
                diagnostics_indicator = function(count, level)
                    local icon = ' '
                    if level:match("error") then
                        icon = ' '
                    elseif level:match("warn") then
                        icon = ' '
                    elseif level:match("hint") then
                        icon = ' '
                    end

                    return " " .. icon .. count
                end
            },
            highlights = {
                fill = {
                    fg = {
                        attribute = "bg",
                        highlight = "Pmenu",
                    },
                    bg = {
                        attribute = "bg",
                        highlight = "Pmenu",
                    },
                },
            },
        },
    },
    { -- A comfy status line
        "glepnir/galaxyline.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        },
    },
    { -- A cool dashboard
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
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
        }
    },
    { -- zen mode for peaceful programming
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 120, -- width of the Zen window
                height = 1,  -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false,   -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0,             -- turn off the statusline in zen mode
                },
                twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false },     -- disables the tmux statusline
                todo = { enabled = false },     -- if set to "true", todo-comments.nvim highlights will be disabled
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
                -- this will change the font size on alacritty when in zen mode
                -- requires  Alacritty Version 0.10.0 or higher
                -- uses `alacritty msg` subcommand to change font size
                alacritty = {
                    enabled = false,
                    font = "14", -- font size
                },
                -- this will change the font size on wezterm when in zen mode
                -- See alse also the Plugins/Wezterm section in this projects README
                wezterm = {
                    enabled = false,
                    -- can be either an absolute font size or the number of incremental steps
                    font = "+4", -- (10% increase per step)
                },
                -- this will change the scale factor in Neovide when in zen mode
                -- See alse also the Plugins/Wezterm section in this projects README
                neovide = {
                    enabled = false,
                    -- Will multiply the current scale factor by this number
                    scale = 1.2,
                    -- disable the Neovide animations while in Zen mode
                    disable_animations = {
                        neovide_animation_length = 0,
                        neovide_cursor_animate_command_line = false,
                        neovide_scroll_animation_length = 0,
                        neovide_position_animation_length = 0,
                        neovide_cursor_animation_length = 0,
                        neovide_cursor_vfx_mode = "",
                    },
                },
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win)
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end,
        },
    },
    { -- Markdown goes pretty in my neovim
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
    },
    { -- Shows the hex colour directly in vim
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
    { -- I want to tell the discord world I program
        "andweeb/presence.nvim",
        opts = {
            -- General options
            auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
            neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
            main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
            client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
            log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
            debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
            enable_line_number  = false,                      -- Displays the current line number instead of the current project
            blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
            buttons             = true,

            -- Rich Presence text options
            editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer
            file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer
            git_commit_text     = "Committing changes", -- Format string rendered when commiting changes in git
            plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins
            reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer
            workspace_text      = "Working on %s",      -- Workspace format string (either string or function(git_project_name: string|nil, buffer: string): string)
            line_number_text    = "Line %s out of %s",  -- Line number format string (for when enable_line_number is set to true)
        },
    },
    {
        "RRethy/vim-illuminate"
    },
    { -- Pretty windows everywhere
        "stevearc/dressing.nvim"
    },
    { -- Moving lines up and down
        "matze/vim-move"
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
            ---Function to call before (un)comment
            pre_hook = nil,
            ---Function to call after (un)comment
            post_hook = nil,
        },
    },
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {
            -- whether to map keybinds or not. default true
            default_mappings = true,
            -- which builtin marks to show. default {}
            builtin_marks = { ".", "<", ">", "^" },
            -- whether movements cycle back to the beginning/end of buffer. default true
            cyclic = true,
            -- whether the shada file is updated after modifying uppercase marks. default false
            force_write_shada = false,
            -- how often (in ms) to redraw signs/recompute mark positions.
            -- higher values will have better performance but may cause visual lag,
            -- while lower values may cause performance penalties. default 150.
            refresh_interval = 250,
            -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
            -- marks, and bookmarks.
            -- can be either a table with all/none of the keys, or a single number, in which case
            -- the priority applies to all marks.
            -- default 10.
            sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
            -- disables mark tracking for specific filetypes. default {}
            excluded_filetypes = {},
            -- disables mark tracking for specific buftypes. default {}
            excluded_buftypes = {},
            -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
            -- sign/virttext. Bookmarks can be used to group together positions and quickly move
            -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
            -- default virt_text is "".
            bookmark_0 = {
                sign = "⚑",
                virt_text = "hello world",
                -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
                -- defaults to false.
                annotate = false,
            },
        }
    }
}
