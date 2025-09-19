vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.beancount",
  command = "silent !bean-format % -c 100 -o %",
  desc = "Run bean-format on save",
})
