local lspconfig = require('lspconfig')

-- harper config
--
lspconfig.harper_ls.setup({
    filetypes = { 'markdown', 'markdown.mdx' },
})
