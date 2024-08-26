return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>qd", "<cmd>Trouble diagnostics toggle<cr>",                      desc = "Diagnostics", },
      { "<leader>qD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",         desc = "Buffer Diagnostics", },
      { "<leader>qq", "<cmd>Trouble qflist toggle<cr>",                           desc = "Quickfix List", },
      { "<leader>ql", "<cmd>Trouble lsp toggle focus=true win.size=0.3<cr>",      desc = "LSP Definitions / references / ...", },
      { "<leader>qs", "<cmd>Trouble symbols toggle focus=false win.size=0.3<cr>", desc = "Symbols", },
    },
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  { "lewis6991/gitsigns.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = { ".DS_Store" }
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      view = {
        width = 35,
      },
    },
    init = function()
      -- Disable default netrw explorer.
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>")
      vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
      vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  { "tpope/vim-fugitive" },
}
