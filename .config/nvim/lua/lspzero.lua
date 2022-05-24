local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.setup_nvim_cmp({
  completion = {
    autocomplete = false,
  },
  documentation = {
    max_height = 15,
    max_width = 60,
    border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
    winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    zindex = 1001
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})
lsp.nvim_workspace()
lsp.setup()
