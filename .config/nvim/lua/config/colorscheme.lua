vim.opt.background = 'dark'
if vim.fn.has('termguicolors') == 1 then
  vim.opt.cursorline = true            -- Highlight cursor line, max column.
  vim.opt.termguicolors = true         -- Enable 24-bit colour.

  vim.api.nvim_create_autocmd({'WinLeave'}, {
    pattern = '*',
    command = 'setlocal nocursorline'
  })
  vim.api.nvim_create_autocmd({'WinEnter'}, {
    pattern = '*',
    command = 'setlocal cursorline'
  })
  vim.api.nvim_create_autocmd({'BufLeave'}, {
    pattern = '*',
    command = 'setlocal nocursorline'
  })
  vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = '*',
    command = 'setlocal cursorline'
  })

  -- Highlight over-length lines.
  vim.api.nvim_create_autocmd({'BufEnter', 'InsertLeave'}, {
    pattern = '*',
    command = 'set colorcolumn=80'
  })
  vim.api.nvim_create_autocmd({'BufEnter', 'InsertLeave'}, {
    pattern = {'*.txt', '*.md'},
    command = 'set colorcolumn=80 | set textwidth=80'
  })
  vim.api.nvim_create_autocmd({'BufEnter', 'InsertLeave'}, {
    pattern = {'*.java', '*.m', '*.mm'},
    command = 'set colorcolumn=100 | set textwidth=100'
  })
end

