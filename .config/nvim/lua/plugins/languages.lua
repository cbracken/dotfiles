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

      -- Only override <C-n>, <C-p> if the cmp menu is visible.
      local function custom_select(select_fn)
        return cmp.mapping(function(fallback)
          if cmp.visible() then
            select_fn()
          else
            fallback() -- Fallback to default behavior if menu is not visible
          end
        end, { 'i', 'c' })
      end

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
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-n>'] = custom_select(cmp.select_next_item),
          ['<C-p>'] = custom_select(cmp.select_prev_item),
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
    dependencies = { "onsails/lspkind.nvim" },
  },
  { "nathangrigg/vim-beancount" },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.clangd.setup({})
      lspconfig.dartls.setup({})
      lspconfig.lua_ls.setup({})
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
    dependencies = { "hrsh7th/cmp-nvim-lsp" }
  },
  { "onsails/lspkind.nvim", },
  { "rhysd/vim-clang-format" },
  { "rust-lang/rust.vim" },
}
