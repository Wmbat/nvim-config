-- Set LSP keybinds
--
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        --
        --
        -- client.server_capabilities.semanticTokensProvider = nil

        -- local function to simplify setting keybinds
        --
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Displays hover information about the symbol under the cursor
        --
        bufmap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')

        -- Go to definition
        --
        -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

        -- Go to declaration
        --
        -- bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')

        -- Go to the definition of the type symbol
        --
        -- bufmap('n', 'go', '<cmd>lua vim.lsp.buf.declaration()<CR>')

        -- Lists all the implementations for the symbol under the cursor
        --
        -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

        -- Lists all the references
        --
        -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')

        -- Displays a function's signature information
        --
        bufmap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

        -- Rename all references to the symbol under the cursor
        --
        bufmap('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')

        -- Selects a code action available at the current cursor position
        --
        bufmap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')

        -- Go to the previous diagnostic
        --
        bufmap('n', '<space>n', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

        -- Go to the next diagnostic
        --
        bufmap('n', '<space>t', '<cmd>lua vim.diagnostic.goto_next()<CR>')

        --
        --
        bufmap('n', '<space>F', '<cmd>lua vim.lsp.buf.format()<CR>')

        --
        --
        bufmap('n', '<space>,', '<cmd>ClangdSwitchSourceHeader<CR>')

        -- Attach illuminate plugin
        --
        require('illuminate').on_attach(client, bufnr)

        -- Attach lsp_signature plugin
        --
        require('lsp_signature').on_attach({
            bind = true,
            floating_window = true,
            hint_enable = false,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end
})
