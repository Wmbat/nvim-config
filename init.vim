lua require('plugins')

set t_Co=256

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" lua require('completion')
" lua require('lsp')
lua require('keybinds')
lua require('treesitter')
lua require('startify')
lua require('git')

lua require('lang')

" set Filetype cpp set foldmethod=syntax

let g:edge_style = 'neon'
let g:edge_current_word = 'bold'

colorscheme edge

filetype on
filetype plugin on

" autocmd CursorHold * silent call CocActionAsync('highlight')

" General keybinds

tnoremap <Esc> <C-\><C-n>

function OpenTerm()
    :bo split
    :res -10
    :term
endfunction

map <silent> <F10> :call OpenTerm()<CR>

" tagbar
map <silent> <F12> :Vista coc<CR>

" Java keybinds
autocmd Filetype java map <F4> :ClangFormat<CR>

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

"inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> <space>h :call <SID>show_documentation()<CR>

nnoremap <silent> <space>d :<C-u>CocDiagnostic<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Latex keybinds
autocmd Filetype tex setl updatetime=10

" Java settings"
autocmd Filetype java set tabstop=4
autocmd Filetype java set shiftwidth=4

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on

" turn hybrid line numbers on
set number relativenumber

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set signcolumn=yes

syntax on

hi GitSignsCurrentLineBlame guifg=grey

let g:move_map_keys = 0

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'edge'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-r>"
let g:UltiSnipsJumpBackwardTrigger="<C-c>"

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:java_highlight_all = 1

"""""""""""
" Vista  "
"""""""""""
let g:vista_executive_for = {
        \ 'cpp' : 'coc',
        \ 'java' : 'coc',
        \ 'python' : 'coc',
        \ }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 50

let g:vimwiki_list = [{'path': '~/vimwiki/'}]

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#7cd1fd', '#939ede', '#ffcb6b', '#aa7fca', '#ff8765'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\       'cmake': 0,
\       'nerdtree': 0
\   }
\}

au BufRead *.pdf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft
