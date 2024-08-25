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
