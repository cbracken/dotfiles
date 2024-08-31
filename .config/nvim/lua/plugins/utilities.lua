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
  },
  {
    "ibhagwan/fzf-lua",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "VeryLazy",
  },
  { "tpope/vim-fugitive" },
}
