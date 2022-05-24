
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

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

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse="a"           
set viminfo=""

"---
" Enable folding
"---
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za

"---
" show ruler
"---
set ruler
set laststatus=2 "always show status line
set statusline=
set statusline+=\ %F
set statusline+=%#Title#
set statusline+=%m%r%h%w
set statusline+=%#StatusLine#
set statusline+=%=
set statusline+=%#StatusLine#
set statusline+=%l:%v\ %p%%

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
set history=250

"---
" show typed commnd in lower right corner (cmd's, selection length, etc)
"---
set showcmd

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
hi CursorLine   cterm=NONE ctermbg=8 " ctermfg=white
hi CursorColumn cterm=NONE ctermbg=8 " ctermfg=white
"set cursorline
"set cursorcolumn

noremap  <F4> :set cursorline! cursorcolumn!<CR>
inoremap <F4> <ESC>:set cursorline! cursorcolumn!<CR>i


"---
" toggle paste
"---
set pastetoggle=<F3>

"---
" linenumbering on / off
"---
set number
noremap  <F2> :set nonumber!<CR>
inoremap <F2> <ESC>:set nonumber!<CR>i


"---
" mappings
"---
nmap ,, <C-]> "jump to tag
nmap <CR> i<CR><ESC>
"nmap <TAB> ==
" auto indent
nmap -- gg=G''
" unhilight search
imap <silent> <C-C> <ESC>:nohlsearch<CR>a
nmap <silent> <C-C> :nohlsearch<CR>

"---
" fix backspace on some systems
"---
set backspace=indent,eol,start

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
set completeopt=longest,menuone,preview "preview shows a nice preview window of the function...
"set completeopt=longest,menuone,preview
"set completeopt=longest,menuone

"
"----------------------------------( python )
"
" enable all Python syntax highlighting features
let python_highlight_all = 1


"
"----------------------------------( yaml )
"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    Plug 'lifepillar/vim-gruvbox8'
    call plug#end()
endif

set background=dark
colorscheme gruvbox8
