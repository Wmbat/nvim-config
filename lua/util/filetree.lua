vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_symlink_arrow = ' >> '
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_special_files = { 
	['README.md'] = true, 
	['Makefile'] = true, 
	['MAKEFILE'] = true,
	['buildfile'] = true,
	['manifest'] = true,
	['repositories.manifest'] = true,
	['packages.manifest'] = true,
}
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0, }
vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		unstaged = "✗",
		staged =  "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { 'startify', 'dashboard' },
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
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
		icons = {
		  webdev_colors = true,
		},
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
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
}
