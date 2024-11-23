local lspconfig = require('lspconfig')

-- clangd LSP config
--
lspconfig.clangd.setup({
    root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
    filetypes = {
        'c',
        'cpp',
    },
    cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        '--clang-tidy',
        '--suggest-missing-includes',
        '--header-insertion=iwyu',
        '--experimental-modules-support',
    },
})
