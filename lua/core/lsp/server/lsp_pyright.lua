local lspconfig = require('lspconfig')

-- pyright config
--
lspconfig.pyright.setup({
	settings = {
		formatCommand = 'black --quiet -',
	},
})
