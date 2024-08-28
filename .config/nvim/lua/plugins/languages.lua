return {
  {
    "https://gn.googlesource.com/gn",
    opts = {},
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {},
    event = "InsertEnter",
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          autocomplete = false,
          completeopt = "menu,menuone,preview,noselect",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 60,
            elipsis_char = "...",
          }),
        },
      })
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
    },
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
          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "<leader>cd", vim.lsp.buf.hover, opts)
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
