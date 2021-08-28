local lsp = require('lspconfig')

require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})

local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = require('lspconfig').util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, _, result)
        if err then error(tostring(err)) end
        if not result then print ("Corresponding file can’t be determined") return end
        vim.api.nvim_command(splitcmd..' '..vim.uri_to_fname(result))
    end)
end

lsp.clangd.setup {
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
    commands = {
        ClangdSwitchSourceHeader = {
    		function() switch_source_header_splitcmd(0, "edit") end;
    		description = "Open source/header in current buffer";
    	},
    	ClangdSwitchSourceHeaderVSplit = {
    		function() switch_source_header_splitcmd(0, "vsplit") end;
    		description = "Open source/header in a new vsplit";
    	},
    	ClangdSwitchSourceHeaderSplit = {
    		function() switch_source_header_splitcmd(0, "split") end;
    		description = "Open source/header in a new split";
    	}
    }
}

lsp.pyright.setup {
    root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd())
}
