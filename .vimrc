syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set scrolloff=5          
set mouse="a"           
set viminfo=""
set clipboard=unnamedplus
set spelllang=ru_ru,en_us
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"---
" Enable folding
"---
set foldmethod=indent
set foldlevel=99

"---
" show ruler
"---
set ruler
set laststatus=2 "always show status line
"set statusline=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set statusline=%#LineNr#\ %.50F
set statusline+=%#Title#%m%r%h%w
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=%#LineNr#\ [%{strlen(&ft)?&ft:'none'}]\ %l:%v\ %p%%

"---
" enable wildmenue (:e ^D) for file selection...
"---
set wildmenu
set wildignore=.o,.exe,.dll,.so,.*~

"---
" tell us when anything was changed by : <cmd>
"---
set report=0

"---
"remove error bell
"---
set noerrorbells
set t_vb=
set visualbell

"---
" set history size
"---
set history=2500

"---
" search stuff
"---
set incsearch
set hlsearch
"set noignorecase
set ignorecase
set magic "extended regexes

"-------
" tabbing
"-------
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ts=4

"-------
" indent
"-------
set autoindent
set smartindent
set cindent

"---
" highlight cursor line and column
"---
set cursorline
"set cursorcolumn

noremap  <F4> :set cursorcolumn!<CR>
inoremap <F4> <ESC>:set cursorcolumn!<CR>i

noremap  <F5> :set cursorline!<CR>
inoremap <F5> <ESC>:set cursorline!<CR>i

"---
" toggle paste
"---
set pastetoggle=<F3>

"---
" color column
"---
set colorcolumn=80
nnoremap <F6> :set colorcolumn= <CR>

"---
" linenumbering on / off
"---
set number
noremap  <F2> :set nonumber!<CR>
inoremap <F2> <ESC>:set nonumber!<CR>i


"---
" mappings
"---
" unhilight search
imap <silent> <C-L> <ESC>:nohlsearch<CR>a

" make Y consitent with D and C (yank til end)
map Y y$

"---
" after using autocomplete close the preview window
" since vim 7.4.
"---
autocmd CompleteDone * pclose

"---
" default encoding
"---
set encoding=utf-8

"---
" completion stuff (^p)
"
" show fancy menu for completition
"---

set completeopt=longest,menuone,preview,noinsert "preview shows a nice preview window of the function...

"Set textwidth to 72 in MarkDown files
au BufRead,BufNewFile *.md setlocal textwidth=72
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

set background=dark
" colorscheme gruvbox8
colorscheme solarized
" colorscheme sourcerer
" hi Normal guibg=NONE ctermbg=NONE 

" --- vim-go setup ---
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

