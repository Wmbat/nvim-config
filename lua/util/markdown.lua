local plugin_name = 'render-markdown'
local is_loaded, md = pcall(require, plugin_name)
if not is_loaded then
    vim.print(string.format(vim.g.failed_to_load_plugin_str, plugin_name))
    return
end

md.setup({})
