

-- saving
--
vim.keymap.set('n', '<space>s', ':w<cr>', {})
vim.keymap.set('n', '<space>S', ':wa<cr>', {})

-- buffers
--
vim.keymap.set('n', '<space>bn', ':bn<CR>', { noremap = true, silent = true });
vim.keymap.set('n', '<space>bp', ':bp<CR>', { noremap = true, silent = true });
vim.keymap.set('n', '<space>bd', ':bd<CR>', { noremap = true, silent = true });

-- vim-move
--
vim.keymap.set('v', '<A-t>', '<Plug>MoveBlockDown', {})
vim.keymap.set('v', '<A-n>', '<Plug>MoveBlockUp', {})
vim.keymap.set('n', '<A-t>', '<Plug>MoveLineDown', {})
vim.keymap.set('n', '<A-n>', '<Plug>MoveLineUp', {})

-- Telescope
--
local tl_builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', tl_builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<space>fg', tl_builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<space>fs', tl_builtin.lsp_workspace_symbols, { noremap = true, silent = true })
vim.keymap.set('n', '<space>gr', tl_builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<space>gi', tl_builtin.lsp_implementations, { noremap = true, silent = true })
vim.keymap.set('n', '<space>gd', tl_builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set('n', '<space>gD', tl_builtin.lsp_type_definitions, { noremap = true, silent = true })

-- Aerial
--
local tl_aerial = require('telescope').extensions.aerial
vim.keymap.set('n', '<space>fa', tl_aerial.aerial, { noremap = true, silent = true })

vim.keymap.set('n', '<space>gs', tl_builtin.git_status, { noremap = true, silent = true })
vim.keymap.set('n', '<space>gc', tl_builtin.git_commits, { noremap = true, silent = true })

vim.keymap.set('n', '<space>dg', tl_builtin.diagnostics, { noremap = true, silent = true })
vim.keymap.set('n', '<space>fb', tl_builtin.buffers, { noremap = true, silent = true })

-- nvim-tree
--
vim.keymap.set('n', '<space>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true, nowait = true })

-- folding
--
local ufo = require("ufo")
vim.keymap.set('n', 'zR', ufo.openAllFolds);
vim.keymap.set('n', 'zM', ufo.closeAllFolds);

-- zen mode
--
vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', { noremap = true, silent = true })

-- Completion
--
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t('<C-n>') or t('<Tab>')
end

function _G.smart_s_tab()
    return vim.fn.pumvisible() == 1 and t('<C-p>') or t('<S-Tab>')
end

vim.keymap.set('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true })
vim.keymap.set('i', '<S-Tab>', 'v:lua.smart_s_tab()', { expr = true, noremap = true })
