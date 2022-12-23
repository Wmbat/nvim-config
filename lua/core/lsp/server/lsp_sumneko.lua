-- Lua LSP config
--
require('lspconfig').sumneko_lua.setup({
	single_file_support = true,
	flags = {
		debounce_text_changes = 150,
	},
})
