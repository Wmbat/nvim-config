local lspconfig = require('lspconfig')

lspconfig.marksman.setup({
    filetypes = { 'markdown', 'markdown.mdx' },
})
