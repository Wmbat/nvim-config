local opts = { noremap = true, silent = true }

vim.keymap.set('i', '<C-y>', '<C-t>', { noremap = true })

vim.keymap.set('n', '<space>s', ':w<cr>', {})
vim.keymap.set('n', '<space>S', ':wa<cr>', {})

-- Window navigation

vim.keymap.set('n', '<C-w>h', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-w>j', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-w>k', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-w>l', ':wincmd l<CR>', { silent = true })

-- buffer navigation
--
vim.keymap.set('n', '<space>bn', ':bn<CR>', opts);
vim.keymap.set('n', '<space>bp', ':bp<CR>', opts);
vim.keymap.set('n', '<space>bd', ':bd<CR>', opts);

-- Telescope
local tl_builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', tl_builtin.find_files, opts)
vim.keymap.set('n', '<space>fg', tl_builtin.live_grep, opts)
vim.keymap.set('n', '<space>fs', tl_builtin.lsp_workspace_symbols, opts)
vim.keymap.set('n', '<space>gr', tl_builtin.lsp_references, opts)
vim.keymap.set('n', '<space>gi', tl_builtin.lsp_implementations, opts)
vim.keymap.set('n', '<space>gd', tl_builtin.lsp_definitions, opts)
vim.keymap.set('n', '<space>gD', tl_builtin.lsp_type_definitions, opts)

local tl_aerial = require('telescope').extensions.aerial
vim.keymap.set('n', '<space>fa', tl_aerial.aerial, opts)

vim.keymap.set('n', '<space>gs', tl_builtin.git_status, opts)
vim.keymap.set('n', '<space>gc', tl_builtin.git_commits, opts)

vim.keymap.set('n', '<space>dg', tl_builtin.diagnostics, opts)
vim.keymap.set('n', '<space>fb', tl_builtin.buffers, opts)

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
