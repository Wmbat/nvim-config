vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.updatetime = 300
vim.o.cmdheight = 2

vim.opt.termguicolors = true

vim.opt.hidden = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.textwidth = 120

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.signcolumn = 'yes'
vim.opt.hidden = true

vim.opt.shortmess:append({ c = true })

vim.opt.list = true
vim.opt.listchars = {
	tab = '⇥ '
}

-- Globals

vim.g.move_map_keys = 0

vim.cmd('set clipboard=unnamedplus')
vim.cmd('autocmd BufNewFile,BufRead *.mpp :set filetype=cpp')
