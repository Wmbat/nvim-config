require("bufferline").setup({
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
        max_prefix_length = 15,     -- prefix used when a buffer is de-duplicated
        truncate_names = true,      -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,     -- only applies to coc
        diagnostics_update_on_event = true,       -- use nvim's diagnostic handler
    },
})
