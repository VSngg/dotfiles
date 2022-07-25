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
set ttymouse=xterm2     " Allow mouse clicks inside tmux
set mouse=a
set viminfo='20,<1000,s1000
set report=0            " Tell when anyting is changed by : <cmd>
set clipboard=unnamedplus

set spelllang=ru_ru,en_us
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,
set langmap+=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
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

" map leader to space
let mapleader=" "

" unhilight search
nnoremap <leader>l :nohl<CR><C-L>
" mark trailing spaces as errors
nnoremap <leader>ms :match IncSearch '\s\+$'<CR>

nnoremap <leader>sl :set list<CR>
nnoremap <leader>sL :set nolist<CR>

nnoremap <leader>p :set paste<CR>i
nnoremap <leader>P :set nopaste<CR>

nnoremap <leader>sc :set colorcolumn= <CR>

nnoremap <leader>c :MUcompleteAutoToggle<CR>

" make Y consitent with D and C (yank til end)
map Y y$

" select previous and next buffer
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

nnoremap <leader>bd :bdelete<CR>

" ----- Completion ----- "

set completeopt=longest,menuone,preview,noinsert

" close preview after using autocomplete
autocmd CompleteDone * pclose

" ----- Filetype Autocommands ----- "

" Set textwidth to 72 in MarkDown files
au BufRead,BufNewFile *.md setlocal textwidth=72

au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType c setlocal tabstop=8 shiftwidth=8 sts=0 noexpandtab

" ----- Plugins ----- "

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-mucomplete'
    Plug 'lifepillar/vim-solarized8'
    Plug 'ap/vim-buftabline'
    Plug 'jaredgorski/fogbell.vim'
    Plug 'chrisbra/Colorizer'
    Plug 'VSngg/solarfog.vim'
    call plug#end()
endif

" ----- Colorscheme ----- "

set background=dark
colorscheme solarfog
set termguicolors

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

