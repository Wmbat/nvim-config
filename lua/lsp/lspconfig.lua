local lsp = require('lspconfig')

on_attach = function(client, bufnr)
    -- Mappings.
    local opts = { noremap=true, silent=true }

    vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    
    vim.api.nvim_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- 
    vim.api.nvim_set_keymap('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>t', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    
    require('lsp_signature').on_attach({
        bind = true,
        handler_opts = {
            border = 'single' 
        }
    }, bufnr)

    require('aerial').on_attach(client, bufnr)
    require('illuminate').on_attach(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.clangd.setup {
    on_attach = on_attach,
    default_config = {
        cmd = {
            "clangd", "--background-index", "--pch-storage=memory",
            "--clang-tidy", "--suggest-missing-includes"
        },
        filetypes = {'c', 'cpp'},
        root_dir = lsp.util.root_pattern('compile_commands.json',
                                         'compile_flags.txt',
                                         '.git'),
    },
    capabilities = capabilities
}

lsp.pyright.setup {
    on_attach = on_attach,
    root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd()),
    capabilities = capabilities
}

lsp.gopls.setup {
    on_attach = on_attach,
    root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd()),
    capabilities = capabilities
}

lsp.clojure_lsp.setup {
    on_attach = on_attach,
    root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd()),
    capabilities = capabilities
}

local signs = { Error = '', Warning = '', Hint = '', Information = '' }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
