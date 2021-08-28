require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.highlights"] = {},
        ["core.keybinds"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
                
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    org = "~/Documents/neorg",
                },
                autodetect = true,
                autochdir = true,
            },
        },
        ["core.norg.esupports"] = {},
    },
}
