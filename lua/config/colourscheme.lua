vim.g.edge_style = 'neon'
vim.g.edge_current_word = 'bold'

vim.cmd('colorscheme edge')

vim.cmd([[hi GitSignsCurrentLineBlame guifg=#7f8394]])

vim.cmd([[hi LspDiagnosticsVirtualTextError guifg=#ec7279]])
vim.cmd([[hi LspDiagnosticsVirtualTextWarning guifg=#deb974]])
vim.cmd([[hi LspDiagnosticsVirtualTextInformation guifg=#6bb3e3]])
vim.cmd([[hi LspDiagnosticsVirtualTextHint guifg=#7f8394]])

vim.cmd([[hi LspDiagnosticsFloatingError guifg=#ec7279]])
vim.cmd([[hi LspDiagnosticsFloatingWarning guifg=#deb974]])
vim.cmd([[hi LspDiagnosticsFloatingInformation guifg=#6bb3e3]])
vim.cmd([[hi LspDiagnosticsFloatingHint guifg=#7f8394]])

vim.cmd([[hi LspDiagnosticsSignError guifg=#ec7279]])
vim.cmd([[hi LspDiagnosticsSignWarning guifg=#deb974]])
vim.cmd([[hi LspDiagnosticsSignInformation guifg=#6bb3e3]])
vim.cmd([[hi LspDiagnosticsSignHint guifg=#7f8394]])
