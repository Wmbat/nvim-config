local lspconfig = require('lspconfig')

lspconfig.powershell_es.setup({
    bundle_path = 'c:/w/PowerShellEditorServices'
    -- bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/"
})
