" ----- Options ----- "

syntax on

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save when editing multiple files
set hidden              " Hide buffers when they are abandoned
set encoding=utf-8

set scrolloff=5
set number              " Show line numbers
set cursorline          " Highlight cursorline
"set cursorcolumn       " Highlight cursorcolumn
set colorcolumn=81

set ttyfast             " Faster scrolling
set mouse="a"
set viminfo='20,<1000,s1000
set report=0            " Tell when anyting is changed by : <cmd>
set clipboard=unnamedplus

set spelllang=ru_ru,en_us
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,
set langmap+=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

match IncSearch '\s\+$' " mark trailing spaces as errors
filetype plugin on      " allow detecting a filetype

" ----- Enable folding ----- "

set foldmethod=indent
set foldlevel=256

" ----- Statusline ----- "

set ruler
set laststatus=2 "always show status line
"set statusline=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set statusline=%#LineNr#\ %.50F
set statusline+=%#Title#%m%r%h%w
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=%#LineNr#\ [%{strlen(&ft)?&ft:'none'}]\ %l:%v\ %p%%

" ----- Enable Wildmenu ----- "

set wildmenu
set wildignore=.o,.exe,.dll,.so,.*~

" ----- Remove error bell ----- "

set noerrorbells
set t_vb=
set visualbell

" ----- Set History Size ----- "

set history=2500

" ----- Search ----- "

set incsearch
set hlsearch
"set noignorecase
set ignorecase
set magic "extended regexes
set wrapscan "wrap while searching

" ----- Tabbing ----- "

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ts=4

" ----- Indent ----- "

set autoindent
set smartindent
set cindent

" ----- Keymaps ----- "

"map leader to space
let mapleader=" "

" unhilight search
nnoremap <C-L> :nohl<CR><C-L>

set pastetoggle=<F3>
nnoremap <F6> :set colorcolumn= <CR>

" make Y consitent with D and C (yank til end)
map Y y$

" ----- Completion ----- "

set completeopt=longest,menuone,preview,noinsert

" close preview after using autocomplete
autocmd CompleteDone * pclose

" ----- Filetype Autocommands ----- "

"Set textwidth to 72 in MarkDown files
au BufRead,BufNewFile *.md setlocal textwidth=72

au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType c set sw=8

" Strip trailing whitespace from files
au FileType c,go au BufWritePre <buffer> %s/\s\+$//e

" ----- Plugins ----- "

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'srcery-colors/srcery-vim'
    Plug 'xero/sourcerer.vim'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'rwxrob/vim-pandoc-syntax-simple'
    Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-mucomplete'
    call plug#end()
endif

" ----- Colorscheme ----- "

set background=dark
" colorscheme gruvbox8
colorscheme solarized
" colorscheme sourcerer
" hi Normal guibg=NONE ctermbg=NONE

" ----- vim-go setup ----- "

let g:go_fmt_fail_silently = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_auto_sameids = 0

