local is_loaded, dashboard = pcall(require, 'dashboard')
if not is_loaded then
    vim.print("Failed to load 'dashboard' plugin.")
    return
end

dashboard.setup({
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
