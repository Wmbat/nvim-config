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

-- Telescope

vim.api.nvim_set_keymap('n', '<space>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<space>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<space>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<space>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)

-- File Explorer

vim.api.nvim_set_keymap('n', '<space>j', ':NvimTreeToggle<CR>', opts)

-- vim-move 

vim.api.nvim_set_keymap('v', '<A-t>', '<Plug>MoveBlockDown', {})
vim.api.nvim_set_keymap('v', '<A-n>', '<Plug>MoveBlockUp', {})
vim.api.nvim_set_keymap('n', '<A-t>', '<Plug>MoveLineDown', {})
vim.api.nvim_set_keymap('n', '<A-n>', '<Plug>MoveLineUp', {})
 
-- gitsigns

vim.api.nvim_set_keymap('n', ']t', '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>', opts)
vim.api.nvim_set_keymap('n', ']n', '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ph', '<cmd>lua require\"gitsigns.actions\".preview_hunk()<CR>', opts)

-- coc-nvim

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent=true })
vim.api.nvim_set_keymap('n', 'gD', '<Plug>(coc-references)', { silent=true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent=true })

vim.api.nvim_set_keymap('n', '<space>m', '<Plug>(coc-rename)', { silent=true })
vim.api.nvim_set_keymap('n', '<space>a', '<Plug>(coc-fix-current)', { silent=true })
vim.api.nvim_set_keymap('n', '<space>n', '<Plug>(coc-diagnostic-prev)', { silent=true })
vim.api.nvim_set_keymap('n', '<space>t', '<Plug>(coc-diagnostic-next)', { silent=true })
