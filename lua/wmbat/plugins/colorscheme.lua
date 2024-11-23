return {
    "wmbat/wmbat-dark",
    priority = 1000,
    branch = "fixing_this_mess",
    dependencies = {
        "rktjmp/lush.nvim"
    },
    config = function()
        require("lush")(require('wmbat-dark').setup({
            plugins = {
                'aerial',
                'gitsigns',
                'nvim-tree',
                'render-markdown',
                'telescope',
                'treesitter',
                'lsp',
            },
        }))

        -- require('lush')(require('wmbat-dark').setup({
        --     plugins = {
        -- --        'gitsigns',
        -- --        'lsp',
        -- --        'nvim-tree',
        -- --        'nvim-ts-rainbow',
        -- --        'telescope',
        -- --        'vim-startify',
        --     },
        --     languages = {
        -- --        'cpp'
        --     },
        -- }))
    end
}
