vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.updatetime = 300
vim.o.cmdheight = 2

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

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
vim.opt.hidden = true

vim.opt.shortmess:append({ c = true })

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Globals

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set the different python environment
--
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.move_map_keys = 0

vim.cmd('set clipboard=unnamedplus')
vim.cmd('autocmd BufNewFile,BufRead *.mpp :set filetype=cpp')
vim.cmd('autocmd BufNewFile,BufRead *.xaml :set filetype=xml')
vim.cmd('autocmd BufNewFile,BufRead *.vert :set filetype=glsl')
vim.cmd('autocmd BufNewFile,BufRead *.frag :set filetype=glsl')

vim.cmd [[set guifont=FiraCode\ Nerd\ Font:h11]]

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})
