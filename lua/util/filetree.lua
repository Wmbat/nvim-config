local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_auto_resize = 0
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_symlink_arrow = ' >> '
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_window_picker_exclude = { filetype = { 'packer', 'qf' }, buftype = { 'terminal' }, }
-- vim.g.nvim_tree_special_files = { 'README.md' = 1, 'Makefile' = 1, 'MAKEFILE' = 1, }
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
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    },
}
vim.g.nvim_tree_disable_default_keybindings = 0
vim.g.nvim_tree_bindings = {
    { key = 's', cb = tree_cb("edit") }
}

vim.api.nvim_command('highlight NvimTreeFolderName guifg=#6bb3e3')
vim.api.nvim_command('highlight NvimTreeEmptyFolderName guifg=#6bb3e3')
vim.api.nvim_command('highlight NvimTreeOpenedFolderName guifg=#6bb3e3')
vim.api.nvim_command('highlight NvimTreeFolderIcon guifg=#6bb3e3')

require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { 'startify', 'dashboard' },
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
}
