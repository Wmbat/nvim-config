-- Language settings

require('nvim_utils')

vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

local autocmds = {
    cpp = {
        {'BufEnter', '*.mpp', 'set filetype=cpp'};
         -- Settings
        {'FileType cpp set foldmethod=expr'};
        {'FileType cpp set foldexpr=nvim_treesitter#foldexpr()'};
        {'FileType cpp set tabstop=4'};
        {'FileType cpp set shiftwidth=4'};
    
        -- Keymaps 
        {'FileType cpp map <space>F :ClangFormat<CR>'}; 
        {'FileType cpp map <space>S <cmd>ClangdSwitchSourceHeader<CR>'}; 
    };
    golang = {
        -- Settings
        {'FileType go set foldmethod=expr'};
        {'FileType go set foldexpr=nvim_treesitter#foldexpr()'};
    };
    json = {
        -- Settings
        {'FileType json set foldmethod=expr'};
        {'FileType json set foldexpr=nvim_treesitter#foldexpr()'};
    };
    python = {
        -- Settings
        {'Filetype python set foldmethod=syntax'};
        {'Filetype python set foldexpr=nvim_treesitter#foldexpr()'};
    };
    neorg = {
        {'Filetype *.norg set :TZAtaraxis'};
    }
}

nvim_create_augroups(autocmds)
