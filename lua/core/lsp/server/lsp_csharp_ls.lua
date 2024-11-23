local lspconfig = require('lspconfig')

lspconfig.csharp_ls.setup({
    root_dir = lspconfig.util.root_pattern('AllSecurityCenter.Generated.sln', '.sln', '.git'),
    filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
})
