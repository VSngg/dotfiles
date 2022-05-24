-- local colorscheme = "gruvbox"
-- local colorscheme = "gruvbox-material"
local colorscheme = "gruvbox-baby"

-- gruvbox material setup
-- vim.g.gruvbox_material_pallete = 'original'

-- gruvbox baby setup
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_comment_style = "italic"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

