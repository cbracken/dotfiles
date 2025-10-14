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
    "mhinz/vim-signify",
    config = function()
      vim.g.signify_vcs_list = { "git", "hg" }
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "VeryLazy",
  },
  { "tpope/vim-fugitive" },
}
