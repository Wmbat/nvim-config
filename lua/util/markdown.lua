local plugin_name = 'render-markdown'
local is_loaded, md = pcall(require, plugin_name)
if not is_loaded then
    vim.g.failed_to_load_plugin(plugin_name)
    return
end

md.setup({})
