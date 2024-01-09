local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c',
--        'cpp',
        'python',
        'go',
        'json',
        'clojure',
        'glsl',
        'toml',
        'latex'
    },
    highlight = {
        enable = true,
    },
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup {
    rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require('ts-rainbow').strategy.global,
    }
}

require('nt-cpp-tools').setup({
    preview = {
        quit = 'q',                           -- optional keymapping for quit preview
        accept = '<tab>'                      -- optional keymapping for accept preview
    },
    header_extension = 'hpp',                 -- optional
    source_extension = 'cpp',                 -- optional
    custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = require('nt-cpp-tools.output_handlers').get_add_to_cpp()
        }
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context)
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
    }
})
