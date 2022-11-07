------------------------
-- General settings
------------------------
lvim.format_on_save = true
lvim.colorscheme = "solarized-flat"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.colorcolumn = "81"
vim.opt.cmdheight = 1
vim.opt.showtabline = 0
vim.opt.mouse = ""

lvim.leader = "space"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>:", "q:")
vim.keymap.set("n", "<S-h>", "<Plug>(CybuPrev)")
vim.keymap.set("n", "<S-l>", "<Plug>(CybuNext)")

vim.keymap.set('n', "<C-h>", '<CMD>NavigatorLeft<CR>')
vim.keymap.set('n', "<C-l>", '<CMD>NavigatorRight<CR>')
vim.keymap.set('n', "<C-k>", '<CMD>NavigatorUp<CR>')
vim.keymap.set('n', "<C-j>", '<CMD>NavigatorDown<CR>')

------------------------
-- Lvim builtin settings
------------------------
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.width = 20
lvim.builtin.nvimtree.setup.view.signcolumn = "auto"
lvim.builtin.breadcrumbs.active = true
lvim.lsp.diagnostics.virtual_text = false


lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "go",
    "gomod",
    "json",
    "lua",
    "python",
    "typescript",
    "css",
    "rust",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.lualine.style = "lvim" -- or "none"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = {}

lvim.builtin.lualine.sections.lualine_b = {
    components.branch,
    components.filename,
}

-- lvim.builtin.lualine.sections.lualine_y = {
--     components.location
-- }
lvim.builtin.lualine.sections.lualine_z = {}

------------------------
-- Additional Plugins
------------------------
lvim.plugins = {
    --{ "ishan9299/nvim-solarized-lua" },
    { "~/git/nvim-solarized-lua" },
    -- { "fatih/vim-go" },
    { "ghillb/cybu.nvim" },
    { "numToStr/Navigator.nvim" },
    { "zah/nim.vim" },
    { "olexsmir/gopher.nvim" },
}

------------------------
-- Formatting
------------------------

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "goimports", filetypes = { "go" } },
    { command = "gofumpt", filetypes = { "go" } },
}

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("golangci_lint_ls", {
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
    on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
    settings = {
        gopls = {
            usePlaceholders = true,
            gofumpt = true,
            codelenses = {
                generate = false,
                gc_details = true,
                test = true,
                tidy = true,
            },
        },
    },
})

------------------------
-- Language Key Mappings
------------------------
lvim.builtin.which_key.mappings["t"] = {
    name = "Go",
    i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
    t = { "<cmd>GoMod tidy<cr>", "Tidy" },
    a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
    A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
    e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
    g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
    f = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
    c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
}

------------------------
-- Plugins setup
------------------------
local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
    return
end

gopher.setup {
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
    },
}


require("cybu").setup({
    postion = {
        relative_to = "cursor",
        anchor = "topcenter",
        vertical_offset = 15,
    },
    behavior = {
        mode = {
            default = {
                switch = "immediate",
                view = "paging", -- paging, rolling
            }
        }
    },
    display_time = 1000,
})

require('Navigator').setup()
