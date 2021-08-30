vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.updatetime = 300
vim.o.cmdheight = 2

vim.opt.termguicolors = true

vim.opt.hidden = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 120

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.signcolumn = 'yes'

vim.opt.shortmess:append({c = true})

-- Globals

vim.g.move_map_keys = 0

vim.g.Powerline_symbols = 'fancy'
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'edge'
