local plugin_name = 'dap'
local is_loaded, dap = pcall(require, plugin_name)
if not is_loaded then
    vim.g.failed_to_load_plugin(plugin_name)
end

local dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

local dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local os_name = vim.loop.os_uname().sysname
if os_name == "Windows_NT" then
    dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.exepath 'netcoredbg',
        args = { '--interpreter=vscode' },
        options = {
            detached = false,
            justMyCode = false,
            stopAtEntry = false,
        },
    }

    dap.configurations.cs = {
        {
            type = 'coreclr',
            name = 'launch',
            request = 'launch',
            program = function()
                if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                    dotnet_build_project()
                end
                return dotnet_get_dll_path()
            end,
        },
        {
            type = 'coreclr',
            name = 'Attach (pick process)',
            request = 'attach',
            processId = require('dap.utils').pick_process,
        }
    }
end
