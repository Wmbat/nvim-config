require('nvim-treesitter.configs').setup({
    modules = {},
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    parser_install_dir = nil,
    ensure_installed = {
        'c',
        'cpp',
        'c_sharp',
        'python',
        'go',
        'json',
        'clojure',
        'glsl',
        'toml',
        'xml',
        'latex',
        'powershell',
    },
    highlight = {
        enable = true,
    },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

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
