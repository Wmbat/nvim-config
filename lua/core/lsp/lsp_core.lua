-- Install language servers
--
require('mason').setup({
    PATH = "prepend",
    registries = {
        "github:mason-org/mason-registry",
        -- "github:seblj/roslyn.nvim",
        "github:Crashdummyy/mason-registry",
    },
})
require('mason-lspconfig').setup()

-- LSP
--
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

require('core.lsp.server')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)
