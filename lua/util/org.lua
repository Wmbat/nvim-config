require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
            },                           
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    org = "~/Documents/neorg",
                }
            }
        }
    },
}

vim.opt.conceallevel = 2
