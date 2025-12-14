" ----- Options ----- "

syntax on

set showcmd             " Show (partial) command in status line
set showmatch           " Show matching brackets
set matchtime=3         " Set matching brackets time
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save when editing multiple files
set hidden              " Hide buffers when they are abandoned
set encoding=utf-8
set path+=**            " Enable recursive :find(remove for big projects)

set scrolloff=5
set number              " Show line numbers
set relativenumber      " Set relative numbers
set cursorline          " Highlight cursorline
"set cursorcolumn       " Highlight cursorcolumn
"set colorcolumn=81
set splitbelow
set splitright

set ttyfast             " Faster scrolling
set ttymouse=xterm2     " Allow mouse clicks inside tmux
set mouse=a
set viminfo='20,<1000,s1000
set noswapfile
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
let mapleader="\<Space>"

" unhilight search
nnoremap <leader>l :nohl<CR><C-L>
" mark trailing spaces as errors
nnoremap <leader>ms :match IncSearch '\s\+$'<CR>

nnoremap <leader>sl :set list!<CR>

"set pastetoggle=<leader>sp
nnoremap <leader>sp :set paste!<CR>

nnoremap <leader>sc :set colorcolumn= <CR>

nnoremap <leader>tm :MUcompleteAutoToggle<CR>
nnoremap <leader>tc :ColorToggle<CR>

" make Y consitent with D and C (yank til end)
map Y y$

" disable Ex mode
nnoremap Q <nop>

" select previous and next buffer
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

nnoremap <leader>q :bdelete<CR>

" ----- Completion ----- "

set completeopt=longest,menuone,preview,noinsert

" close preview after using autocomplete
autocmd CompleteDone * pclose

" ----- Filetype Autocommands ----- "

au FileType c setlocal noet ts=8 sw=8 tw=80
au FileType h setlocal noet ts=8 sw=8 tw=80
au FileType cpp setlocal noet ts=8 sw=8 tw=80
au FileType s setlocal noet ts=8 sw=8
au FileType go setlocal noet ts=4 sw=4
au BufRead,BufNewFile *.js setlocal et ts=2 sw=2
au FileType html setlocal et ts=2 sw=2
au FileType htmldjango setlocal et ts=2 sw=2
au FileType scss setlocal et ts=2 sw=2
au FileType yaml setlocal et ts=2 sw=2
au FileType markdown setlocal tw=80 et ts=2 sw=2
au FileType text setlocal tw=80

" ----- Plugins ----- "

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    "Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-mucomplete'
    Plug 'ap/vim-buftabline'
    "Plug 'jaredgorski/fogbell.vim'
    "Plug 'chrisbra/Colorizer'
    "Plug 'VSngg/solarfog.vim'
    "Plug 'junegunn/goyo.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'davidhalter/jedi-vim'
    Plug 'christoomey/vim-tmux-navigator'
    call plug#end()
endif

" ----- Colorscheme ----- "

set background=dark
"colorscheme fogbell
colorscheme habamax
set termguicolors

" ----- vim-go Setup ----- "

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
let g:go_doc_popup_window = 1

" ----- Netrw Setup ----- "

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Toggle Vexplore
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction

" ----- Plugin Keymaps ----- "

map <silent> <leader>e :call ToggleVExplorer()<CR>
map <silent> <leader>f :Files<CR>
