return {
    "wmbat/wmbat-dark",
    priority = 1000,
    commit = "c72d5e8",
    dependencies = {
        "rktjmp/lush.nvim"
    },
    config = function()
        require('lush')(require('wmbat-dark'))
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
