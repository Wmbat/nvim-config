local dap = require('dap')

dap.set_log_level('DEBUG')

require('wmbat.debugging.debug_cpp')
require('wmbat.debugging.debug_csharp')

-- keybinds
--
-- vim.keymap.set('n', '<leader>dl', dap.launch, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>da', dap.attach, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dj', dap.step_over, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dl', dap.step_into, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dh', dap.step_out, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>B',
    '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>',
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lp',
    '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>',
    { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end,
    { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
