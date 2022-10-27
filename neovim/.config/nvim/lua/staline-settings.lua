-- local base03 = "#002b36"
-- local base02 = "#073642"
-- local base01 = "#586e75"
-- local base00 = "#657b83"
local base0 = "#839496"
-- local base1 = "#93a1a1"
-- local gray = "#74888d"
-- local yellow = "#b58900"
-- local orange = "#cb4b16"
-- local red = "#dc322f"
local magenta = "#d33682"
local violet = "#6c71c4"
-- local blue = "#268bd2"
local cyan = "#2aa198"

require("staline").setup {
	sections = {
		left = { '  ', 'lsp', 'file_name', 'branch' },
		mid = {},
		right = {'', 'line_column' }
	},
	mode_colors = {
		i = cyan,
		n = base0,
		c = violet,
		v = magenta,
	},
	defaults = {
        fg = base0,
        full_path = true,
		true_colors = true,
        line_column     = "%l:%c %p%% ", -- `:h stl` to see all flags.
		branch_symbol = " "
	}
}
