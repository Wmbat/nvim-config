vim.g.edge_style = 'neon'
vim.g.edge_current_word = 'bold'

vim.cmd('colorscheme edge')

vim.api.nvim_command('hi GitSignsCurrentLineBlame guifg=#7f8394')

vim.api.nvim_command('hi LspDiagnosticsVirtualTextError guifg=#ec7279')
vim.api.nvim_command('hi LspDiagnosticsVirtualTextWarning guifg=#deb974')
vim.api.nvim_command('hi LspDiagnosticsVirtualTextInformation guifg=#a0c980')
vim.api.nvim_command('hi LspDiagnosticsVirtualTextHint guifg=#7f8394')

vim.api.nvim_command('hi LspDiagnosticsFloatingError guifg=#ec7279')
vim.api.nvim_command('hi LspDiagnosticsFloatingWarning guifg=#deb974')
vim.api.nvim_command('hi LspDiagnosticsFloatingInformation guifg=#a0c980')
vim.api.nvim_command('hi LspDiagnosticsFloatingHint guifg=#7f8394')

vim.fn.sign_define('LspDiagnosticsSignError', { 
    texthl = 'LspDiagnosticsSignError',
    text = '', 
    numhl = 'LspDiagnosticsSignError' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { 
    texthl = 'LspDiagnosticsSignWarning',
    text = '',
    numhl = 'LspDiagnosticsSignWarning'})
vim.fn.sign_define('LspDiagnosticsSignHint', { 
    text = '', 
    texthl = 'LspDiagnosticsSignHint',
    numhl = 'LspDiagnosticsSignHint', })
vim.fn.sign_define('LspDiagnosticsSignInformation', { 
    text = '', 
    texthl = 'LspDiagnosticsSignInformation',
    numhl = 'LspDiagnosticsSignInformation', })
