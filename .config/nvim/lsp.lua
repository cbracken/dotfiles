require'lspconfig'.clangd.setup{}
require'lspconfig'.dartls.setup{}
require'lspconfig'.rust_analyzer.setup{}
vim.diagnostic.config{virtual_text = false, signs = false, underline = false, update_in_insert = false};
