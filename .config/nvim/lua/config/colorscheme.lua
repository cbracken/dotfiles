vim.opt.background = 'dark'
if vim.fn.has('termguicolors') == 1 then
  vim.opt.cursorline = true            -- Highlight cursor line, max column.
  vim.opt.termguicolors = true         -- Enable 24-bit colour.

  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.opt_local.cursorline = true
    end,
  })
  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    callback = function()
      vim.opt_local.cursorline = false
    end,
  })

  -- Highlight over-length lines.
  vim.opt_local.colorcolumn = "80"
  vim.opt_local.textwidth = 80
end
