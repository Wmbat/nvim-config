local lspconfig = require('lspconfig')

lspconfig.powershell_es.setup({
    filetypes = 'ps1',
    cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command', "c:/PSES/Start-EditorServices.ps1 ..." },
    -- bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
    init_options = {
        enableProfileLoading = false,
    },
})
