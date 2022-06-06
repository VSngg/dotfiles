require("plugins")
require("options")
require("keymaps")
require("colorscheme")
require("lualine").setup({
  options = {
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    theme = "gruvbox-baby",
  }
})
require("bufferline").setup {
  options = {
    always_show_bufferline = false,
    show_close_icon = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  }
}
require("nvimtree")
-- require("autopairs")
require("comments")
require("treesitter")
require("colorize")
require("lspzero")
