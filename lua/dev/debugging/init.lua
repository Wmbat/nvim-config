local dap = require('dap')

dap.set_log_level('DEBUG')

require('dev.debugging.debug_cpp')
require('dev.debugging.debug_csharp')

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
    '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
vim.keymap.set('n', '<leader>lp',
    '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts)

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

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    layouts = {
        {
            -- You can change the order of elements in the sidebar
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                { id = "scopes",      size = 0.25, },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks",      size = 0.25 },
                { id = "watches",     size = 00.25 },
            },
            size = 80,
            position = "right", -- Can be "left", "right", "top", "bottom"
        },
        -- {
        --     elements = { "repl" },
        --     size = 10,
        --     position = "bottom", -- Can be "left", "right", "top", "bottom"
        -- }
    },
    floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})
