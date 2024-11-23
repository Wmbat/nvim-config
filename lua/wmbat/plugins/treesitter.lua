return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup({
            modules = {},
            sync_install = true,
            auto_install = true,
            ignore_install = {},
            parser_install_dir = nil,
            ensure_installed = {
                'c',
                'cpp',
                'c_sharp',
                'python',
                'go',
                'json',
                'clojure',
                'glsl',
                'toml',
                'xml',
                'latex',
                'powershell',
            },
            highlight = {
                enable = true,
            },
        })
    end,
}
