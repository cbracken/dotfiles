return {
  {
    "https://gn.googlesource.com/gn",
    opts = {},
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")
    end
  },
  { "nathangrigg/vim-beancount" },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      if vim.fn.executable('clangd') == 1 then
        lspconfig.clangd.setup({})
      end
      if vim.fn.executable('dart') == 1 then
        lspconfig.dartls.setup({})
      end
      if vim.fn.executable('lua-language-server') == 1 then
        lspconfig.lua_ls.setup({})
      end
      if vim.fn.executable('rust-analyzer') == 1 then
        lspconfig.rust_analyzer.setup({})
      end
      if vim.fn.executable('sourcekit-lsp') == 1 then
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

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "See available code actions"
          vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
  { "rhysd/vim-clang-format" },
  { "rust-lang/rust.vim" },
}
