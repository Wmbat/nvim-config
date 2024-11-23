local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end

local plugin_name = 'ufo'
local is_loaded, ufo = pcall(require, plugin_name)
if not is_loaded then
    vim.g.failed_to_load_plugin(plugin_name)
end

ufo.setup()

vim.keymap.set('n', 'zR', ufo.openAllFolds);
vim.keymap.set('n', 'zM', ufo.closeAllFolds);
