return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      opts.winopts = {
        preview = {
          vertical = "down:65%",
          layout = "vertical",
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "VeryLazy",
  },
  { "tpope/vim-fugitive" },
}
