-- Globals.
vim.g.mouse = 0                        -- Disable visual-mode mouse select.
vim.g.mapleader=' '                    -- Set <leader> key.

-- Basic options
vim.opt.incsearch = true               -- Turn on incremental searching.
vim.opt.hlsearch = true                -- Highlight search.
vim.opt.visualbell = true              -- Less noise.
vim.opt.number = true                  -- Use line numbering.
vim.opt.ruler = true                   -- Show row/col in status.
vim.opt.laststatus = 2                 -- Always show status line.
vim.opt.showmatch = true               -- Highlight matching bracket.
vim.opt.history = 50                   -- Keep 50 lines of cmdline history.
vim.opt.wildmenu = true                -- Nicer autocomplete.
vim.opt.wildmode = {'longest', 'full'}
vim.opt.wildignore = {'*.o', '*.pyc'}  -- Ignore some filetypes during completion.
vim.opt.spelllang = 'en_ca'            -- Set the spelling language.
vim.opt.completeopt:append('longest')  -- Insert longest common prefix of options.
vim.opt.autoindent = true              -- Copy indent from current line when starting a new line.
vim.opt.smartindent = true             -- Attempt to autoindent when starting a new line.
vim.opt.smarttab = true                -- Use shiftwidth rather than tabstop at start of line.
vim.opt.tabstop = 2                    -- Number of spaces per tab.
vim.opt.shiftwidth = 2                 -- Number of spaces for each step of autoindent.
vim.opt.softtabstop = 2                -- Number of spaces per tab when editing.
vim.opt.expandtab = true               -- Insert spaces in place of tabs.

-- Fix Python's indent overrides.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end
})

-- Configure colour scheme and syntax highlighting.
vim.opt.background = 'dark'
if vim.fn.has('termguicolors') == 1 then
  vim.opt.cursorline = true            -- Highlight cursor line, max column.
  vim.opt.termguicolors = true         -- Enable 24-bit colour.
  vim.cmd('colorscheme solarized-osaka')

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
