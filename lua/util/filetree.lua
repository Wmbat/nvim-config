vim.g.nvim_tree_refresh_wait = 500

require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { 'startify', 'dashboard' },
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	respect_buf_cwd = false,
	view = {
		width = 50,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {}
		},
		number = false,
		relativenumber = false
	},
	renderer = {
		indent_markers = {
		  enable = false,
		  icons = {
			corner = "└ ",
			edge = "│ ",
			none = "  ",
		  },
		},
		add_trailing = true,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		special_files = {
			"README.md",
			"Makefile",
			"MAKEFILE",
			"buildfile",
			"manifest",
			"repositories.manifest",
			"packages.manifest",
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		highlight_git = true,
		group_empty = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable      = false,
		update_cwd  = false,
		ignore_list = {}
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd  = nil,
		args = {}
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	filters = {
		dotfiles = true,
		custom = {},
		exclude = {}
	},
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
}
