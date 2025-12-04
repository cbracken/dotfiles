-- Don't wrap beancount files.
vim.opt_local.textwidth = 0
vim.opt_local.wrap = false

-- Format on save.
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Run bean-format on save",
  callback = function(args)
    local filepath = vim.api.nvim_buf_get_name(args.buf)
    local filename = vim.fn.fnamemodify(filepath, ":t") -- just the tail name
    local cmd
    if filepath:match("[\\/]prices[\\/]") then
      -- prices_* are formatted without a hardcoded currency column.
      cmd = string.format("silent !bean-format %s -o %s", vim.fn.shellescape(filepath), vim.fn.shellescape(filepath))
    else
      -- other beancount files are formatted with currency on 80th column.
      cmd = string.format("silent !bean-format -c 80 %s -o %s", vim.fn.shellescape(filepath), vim.fn.shellescape(filepath))
    end
    vim.cmd(cmd)
  end,
})
