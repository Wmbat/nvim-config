-- Lua LSP config
--
require('lspconfig').lua_ls.setup({
	single_file_support = true,
	flags = {
		debounce_text_changes = 150,
	},
})
