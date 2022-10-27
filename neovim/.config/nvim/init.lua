-- ----- Options ----- --

local set = vim.opt

set.showcmd = true             -- Show (partial) command in status line
set.showmatch = true           -- Show matching brackets
set.matchtime = 3              -- Set matching brackets time

set.autowrite = true           -- Automatically save when editing multiple files
set.hidden = true              -- Hide buffers when they are abandoned
set.encoding = "utf-8"
set.pumheight = 10             -- Pop-up menu height

set.scrolloff = 5
set.number = true              -- Show line numbers
set.signcolumn = "yes"
set.cursorline = true          -- Highlight cursorline
-- set.cursorcolumn = true       -- Highlight cursorcolumn
set.colorcolumn = "81"
set.splitbelow = true
set.splitright = true

set.mouse = "a"
set.swapfile = false
set.report = 0            -- Tell when anyting is changed by : <cmd>
set.clipboard = "unnamedplus"

-- set.spelllang = ru_ru,en_us
set.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,"..
"фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- ----- Enable folding ----- --

set.foldmethod = "indent"
set.foldlevel=256

-- ----- Statusline ----- --

set.ruler = true
set.laststatus = 3 --always show status line
set.showtabline = 1

set.history=2500

-- ----- Search ----- --

set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true           -- Do smart case matching
set.magic = true --extended regexes
set.wrapscan = true --wrap while searching

-- ----- Tabbing ----- --

set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4

-- ----- Indent ----- --

set.autoindent = true
set.smartindent = true
set.cindent = true

-- ----- Colorscheme ----- --

set.termguicolors = true
vim.cmd('colorscheme neosolarfog')

-- ----- Keymaps ----- --

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ' '

-- unhilight search
map('n', '<leader>l', ':nohl<CR>')
-- nnoremap <leader>sl :set list!<CR>
-- disable Ex mode
map('n', 'Q', '<nop>')
-- select previous and next buffer
-- map('n', 'H', ':bprev<CR>')
-- map('n', 'L', ':bnext<CR>')
map('n', '<leader>q', ':bdelete<CR>')

-- Telescope --
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>e', ':Telescope file_browser<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fn', ':Telescope help_tags<CR>')

-- Cybu --
vim.keymap.set("n", "H", "<Plug>(CybuPrev)")
vim.keymap.set("n", "L", "<Plug>(CybuNext)")

-- Navigator(tmux) --
vim.keymap.set('n', "<C-h>", '<CMD>NavigatorLeft<CR>')
vim.keymap.set('n', "<C-l>", '<CMD>NavigatorRight<CR>')
vim.keymap.set('n', "<C-k>", '<CMD>NavigatorUp<CR>')
vim.keymap.set('n', "<C-j>", '<CMD>NavigatorDown<CR>')

-- Nvim-Tree --
-- map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Jupyter-Ascending --
vim.cmd[[ nnoremap <silent><leader>jx <Plug>JupyterExecute ]]
vim.cmd[[ nnoremap <silent><leader>ja <Plug>JupyterExecuteAll ]]

-- ----- REQUIRE STUFF ----- --
require('plugins')
require('lsp')
require('staline-settings')
require('nvimtree-settings')
require('cybu-setup')
require('telescope-settings')

require('nvim-autopairs').setup{}
require('colorizer').setup{}
require('Navigator').setup()
-- require('indent_blankline').setup{}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})

-- -- ----- Filetype Autocommands ----- --
-- au FileType c setlocal noet ts=8 sw=8 tw=80
-- au FileType h setlocal noet ts=8 sw=8 tw=80
-- au FileType cpp setlocal noet ts=8 sw=8 tw=80
-- au FileType s setlocal noet ts=8 sw=8
-- au FileType go setlocal noet ts=4 sw=4
-- au BufRead,BufNewFile *.js setlocal et ts=2 sw=2
-- au FileType html setlocal et ts=2 sw=2
-- au FileType htmldjango setlocal et ts=2 sw=2
-- au FileType scss setlocal et ts=2 sw=2
-- au FileType yaml setlocal et ts=2 sw=2
-- au FileType markdown setlocal tw=80 et ts=2 sw=2
-- au FileType text setlocal tw=80
