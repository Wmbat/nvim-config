-- Set LSP keybinds
--
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            -- client.server_capabilities.semanticTokensProvider = nil
        end

        -- Displays hover information about the symbol under the cursor
        --
        vim.keymap.set("n", "<space>h", vim.lsp.buf.hover, { buffer = bufnr, remap = false })

        -- Go to definition
        --
        -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

        -- Go to declaration
        --
        -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")

        -- Go to the definition of the type symbol
        --
        -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.declaration()<CR>")

        -- Lists all the implementations for the symbol under the cursor
        --
        -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")

        -- Lists all the references
        --
        -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

        -- Displays a function"s signature information
        --
        vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { buffer = bufnr, remap = false })

        -- Rename all references to the symbol under the cursor
        --
        vim.keymap.set("n", "<space>m", vim.lsp.buf.rename, { buffer = bufnr, remap = false })

        -- Selects a code action available at the current cursor position
        --
        vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { buffer = bufnr, remap = false })

        -- Go to the previous diagnostic
        --
        vim.keymap.set("n", "<space>k", vim.diagnostic.goto_prev, { buffer = bufnr, remap = false })

        -- Go to the next diagnostic
        --
        vim.keymap.set("n", "<space>j", vim.diagnostic.goto_next, { buffer = bufnr, remap = false })

        --
        --
        vim.keymap.set("n", "<space>F", vim.lsp.buf.format, { buffer = bufnr, remap = false })

        --
        --
        vim.keymap.set("n", "<space>,", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr, remap = false })

        -- Attach illuminate plugin
        --
        require("illuminate").on_attach(client)

        -- Attach lsp_signature plugin
        --
        require("lsp_signature").on_attach({
            bind = true,
            floating_window = true,
            hint_enable = false,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)

        local preview = require("goto-preview")
        vim.keymap.set("n", "gpd", preview.goto_preview_definition, { buffer = bufnr, remap = false })
        vim.keymap.set("n", "gpD", preview.goto_preview_declaration, { buffer = bufnr, remap = false })
        vim.keymap.set("n", "gpt", preview.goto_preview_type_definition, { buffer = bufnr, remap = false })
        vim.keymap.set("n", "gpi", preview.goto_preview_implementation, { buffer = bufnr, remap = false })
        vim.keymap.set("n", "gP", preview.close_all_win, { buffer = bufnr, remap = false })
    end
})
