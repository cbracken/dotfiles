return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics", },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics", },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List", },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols", },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ...", },
    },
  },
  { "ibhagwan/fzf-lua" },
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
}
