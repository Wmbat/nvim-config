-- require('lsp.snip')
-- require('lsp.completion')
-- require('lsp.lspconfig')
require('lsp.lang')
require('lsp.lsp_diagnostics')
require('lsp.treesitter')

local lspkind = require('lspkind')
lspkind.init({
    mode = 'symbol_text',
    symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
    },
})

local lspconfig = require('lspconfig')
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
	'clangd'
})
lsp.configure('clangd', {
	default_config = {
		cmd = {
			"clangd", "--background-index", "--pch-storage=memory",
			"--clang-tidy", "--suggest-missing-includes"
		},
		filetypes = {'c', 'cpp'},
		root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
	},
})
lsp.set_preferences({
	sign_icons = {
		error = '',
		warn = '',
		hint = '',
		info = ''
	},
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<C-n>'] = cmp.mapping.select_prev_item()
cmp_mappings['<C-t>'] = cmp.mapping.select_next_item()
cmp_mappings['<C-d>'] = cmp.mapping.scroll_docs(-4)
cmp_mappings['<C-f>'] = cmp.mapping.scroll_docs(4)
cmp_mappings['<C-Space>'] = cmp.mapping.complete()
cmp_mappings['<C-e>'] = cmp.mapping.close()

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})
lsp.on_attach(
	function(client, bufnr)
		local noremap = {buffer = bufnr, remap = false}
		local bind = vim.keymap.set

		bind('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', noremap)
		bind('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', noremap)
		bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', noremap)
		bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', noremap)

		bind('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap)
		bind('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', noremap)
		bind('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', noremap)

		bind('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>', noremap)

		bind('n', '<space>n', '<cmd>lua vim.diagnostic.goto_prev()<CR>', noremap)
		bind('n', '<space>t', '<cmd>lua vim.diagnostic.goto_next()<CR>', noremap)

    	require('aerial').on_attach(client, bufnr)
    	require('illuminate').on_attach(client, bufnr)
	end
)
lsp.setup()
