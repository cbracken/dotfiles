-- Git add/modify/removed signs in the gutter.
require('gitsigns').setup({})

-- Language server configuration.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.dartls.setup({})
lspconfig.rust_analyzer.setup({})

-- Don't show warnings, errors, etc. by default.
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
});
