local opts = { noremap = true, silent = true }

-- vim.keymap.set('', 'Q', 'J', { noremap = true })
-- vim.keymap.set('', 'j', 'b', { noremap = true })
-- vim.keymap.set('', 'J', 'B', { noremap = true })
-- vim.keymap.set('', 'b', 'n', { noremap = true })
-- vim.keymap.set('', 'B', 'N', { noremap = true })
-- vim.keymap.set('', 'h', 'h', { noremap = true })
-- vim.keymap.set('', 't', 'j', { noremap = true })
-- vim.keymap.set('', 'n', 'k', { noremap = true })
-- vim.keymap.set('', 's', 'l', { noremap = true })

vim.keymap.set('i', '<C-y>', '<C-t>', { noremap = true })

vim.keymap.set('n', '<space>s', ':w<cr>', {})
vim.keymap.set('n', '<space>S', ':wa<cr>', {})

vim.keymap.set('n', 'zR', require('ufo').openAllFolds);
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds);

-- Window navigation

vim.keymap.set('n', '<C-w>h', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-w>j', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-w>k', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-w>l', ':wincmd l<CR>', { silent = true })

-- buffer navigation
--
vim.keymap.set('n', '<space>bn', ':bn<CR>', opts);
vim.keymap.set('n', '<space>bp', ':bn<CR>', opts);

-- Telescope
local tl_builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', tl_builtin.find_files, opts)
vim.keymap.set('n', '<space>fg', tl_builtin.live_grep, opts)
vim.keymap.set('n', '<space>fs', tl_builtin.lsp_workspace_symbols, opts)
vim.keymap.set('n', '<space>gr', tl_builtin.lsp_references, opts)
vim.keymap.set('n', '<space>gi', tl_builtin.lsp_implementations, opts)
vim.keymap.set('n', '<space>gd', tl_builtin.lsp_definitions, opts)
vim.keymap.set('n', '<space>gD', tl_builtin.lsp_type_definitions, opts)

vim.keymap.set('n', '<space>gs', tl_builtin.git_status, opts)
vim.keymap.set('n', '<space>gc', tl_builtin.git_commits, opts)

vim.keymap.set('n', '<space>dg', tl_builtin.diagnostics, opts)
-- vim.keymap.set('n', '<space>fs', tl_builtin.buffers, opts)

-- goto-preview
local goto_preview = require('goto-preview')
vim.keymap.set('n', 'gpd', goto_preview.goto_preview_definition, opts)
vim.keymap.set('n', 'gpD', goto_preview.goto_preview_declaration, opts)
vim.keymap.set('n', 'gpt', goto_preview.goto_preview_type_definition, opts)
vim.keymap.set('n', 'gpi', goto_preview.goto_preview_implementation, opts)
vim.keymap.set('n', 'gP', goto_preview.close_all_win, opts)

-- File Explorer

vim.keymap.set('n', '<space>t', ':NvimTreeToggle<CR>', opts)

-- vim-move

vim.keymap.set('v', '<A-t>', '<Plug>MoveBlockDown', {})
vim.keymap.set('v', '<A-n>', '<Plug>MoveBlockUp', {})
vim.keymap.set('n', '<A-t>', '<Plug>MoveLineDown', {})
vim.keymap.set('n', '<A-n>', '<Plug>MoveLineUp', {})

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

vim.keymap.set("i", "<C-l>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-l>", "<Plug>luasnip-next-choice", {})

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

-- Zen Mode
--
vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', opts)

--nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
