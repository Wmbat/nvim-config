local opts = { noremap = true, silent = true }

vim.keymap.set('', 'Q', 'J', { noremap = true })
vim.keymap.set('', 'j', 'b', { noremap = true })
vim.keymap.set('', 'J', 'B', { noremap = true })
vim.keymap.set('', 'b', 'n', { noremap = true })
vim.keymap.set('', 'B', 'N', { noremap = true })
vim.keymap.set('', 'h', 'h', { noremap = true })
vim.keymap.set('', 't', 'j', { noremap = true })
vim.keymap.set('', 'n', 'k', { noremap = true })
vim.keymap.set('', 's', 'l', { noremap = true })

vim.keymap.set('i', '<C-y>', '<C-t>', { noremap = true })

vim.keymap.set('n', '<space>s', ':w<cr>', {})

vim.keymap.set('n', 'zR', require('ufo').openAllFolds);
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds);

-- Window navigation

vim.keymap.set('n', '<C-w>h', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-w>t', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-w>n', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-w>s', ':wincmd l<CR>', { silent = true })

-- Telescope

vim.keymap.set('n', '<space>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.keymap.set('n', '<space>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.keymap.set('n', '<space>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.keymap.set('n', '<space>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)

-- File Explorer

vim.keymap.set('n', '<space>j', ':NvimTreeToggle<CR>', opts)

-- vim-move

vim.keymap.set('v', '<A-t>', '<Plug>MoveBlockDown', {})
vim.keymap.set('v', '<A-n>', '<Plug>MoveBlockUp', {})
vim.keymap.set('n', '<A-t>', '<Plug>MoveLineDown', {})
vim.keymap.set('n', '<A-n>', '<Plug>MoveLineUp', {})

-- gitsigns

vim.keymap.set('n', ']t', '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>', opts)
vim.keymap.set('n', ']n', '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>', opts)
vim.keymap.set('n', '<leader>hp', '<cmd>lua require\"gitsigns.actions\".preview_hunk()<CR>', opts)
vim.keymap.set('n', '<leader>hs', '<cmd>lua require\"gitsigns.actions\".stage_hunk()<CR>', opts)
vim.keymap.set('n', '<leader>hS', '<cmd>lua require\"gitsigns.actions\".stage_buffer()<CR>', opts)
vim.keymap.set('n', '<leader>hu', '<cmd>lua require\"gitsigns.actions\".undo_stage_hunk()<CR>', opts)
vim.keymap.set('n', '<leader>hr', '<cmd>lua require\"gitsigns.actions\".reset_hunk()<CR>', opts)
vim.keymap.set('n', '<leader>hR', '<cmd>lua require\"gitsigns.actions\".reset_buffer()<CR>', opts)

-- vim.keymap.set('n', '<space>F', ':LspZeroFormat<CR>', opts)

-- Completion

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t '<C-n>' or t '<Tab>'
end

function _G.smart_s_tab()
    return vim.fn.pumvisible() == 1 and t '<C-p>' or t '<S-Tab>'
end

vim.keymap.set('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true })
vim.keymap.set('i', '<S-Tab>', 'v:lua.smart_s_tab()', { expr = true, noremap = true })

-- luasnip

vim.keymap.set("i", "<C-j>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-j>", "<Plug>luasnip-next-choice", {})

-- trouble

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble<cr>', opts)

-- Debugging

vim.keymap.set('n', '<F5>', '<cmd>lua require\'dap\'.continue()<CR>', opts)
vim.keymap.set('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<CR>', opts)
vim.keymap.set('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<CR>', opts)
vim.keymap.set('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
vim.keymap.set('n', '<leader>B',
    '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
vim.keymap.set('n', '<leader>lp',
    '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts)

vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end, opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end, opts)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)


--nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
