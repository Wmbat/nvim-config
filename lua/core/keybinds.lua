local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('', 'h', 'h', { noremap=true })
vim.api.nvim_set_keymap('', 't', 'j', { noremap=true })
vim.api.nvim_set_keymap('', 'n', 'k', { noremap=true })
vim.api.nvim_set_keymap('', 's', 'l', { noremap=true })
vim.api.nvim_set_keymap('', 'b', 'n', { noremap=true })
vim.api.nvim_set_keymap('', 'B', 'N', { noremap=true })

vim.api.nvim_set_keymap('n', '<space>s', ':w<cr>', {})

-- Window navigation

vim.api.nvim_set_keymap('n', '<C-w>h', ':wincmd h<CR>', { silent=true })
vim.api.nvim_set_keymap('n', '<C-w>t', ':wincmd j<CR>', { silent=true })
vim.api.nvim_set_keymap('n', '<C-w>n', ':wincmd k<CR>', { silent=true })
vim.api.nvim_set_keymap('n', '<C-w>s', ':wincmd l<CR>', { silent=true })
