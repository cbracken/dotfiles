vim.api.nvim_create_autocmd("BufWritePost", {
  command = "silent !bean-format % -c 100 -o %",
  desc = "Run bean-format on save",
})
