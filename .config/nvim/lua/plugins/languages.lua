return {
  {
    "https://gn.googlesource.com/gn",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")
    end
  },
  { "nathangrigg/vim-beancount" },
  {
    "neovim/nvim-lspconfig",
    config = function(plugin)
      local lspconfig = require('lspconfig')
      lspconfig.clangd.setup({})
      lspconfig.dartls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
    end
  },
  { "rhysd/vim-clang-format" },
  { "rust-lang/rust.vim" },
}
