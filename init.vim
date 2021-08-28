lua require('plugins')

set t_Co=256

filetype on
filetype plugin on

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

syntax on

lua require('core')
lua require('dev')
lua require('appearance')

tnoremap <Esc> <C-\><C-n>

function OpenTerm()
    :bo split
    :res -10
    :term
endfunction

map <silent> <F10> :call OpenTerm()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
