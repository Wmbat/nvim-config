require('core.settings')
require('core.colours')
require('core.ts')
require('core.lsp')
require('core.filetree')
require('core.statusline')
require('core.fold')

---Prints out that a plugin failed to load. 
---@param plugin_name string
vim.g.failed_to_load_plugin = function(plugin_name)
    vim.print(string.format("Failed to load '%s' plugin.", plugin_name))
end
