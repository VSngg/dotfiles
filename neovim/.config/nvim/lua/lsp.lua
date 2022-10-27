require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
  completion = {autocomplete = false}
})

lsp.setup()
