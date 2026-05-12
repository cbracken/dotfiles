-- Basic options
vim.opt.mouse = ''                     -- Disable visual-mode mouse select.
vim.opt.clipboard = 'unnamedplus'      -- Use the system clipboard on macOS.
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
vim.opt.autocomplete = false             -- Enable native auto-completion.
vim.opt.completeopt = 'menu,menuone,noselect,popup,longest' -- Improved completion behaviour.
vim.opt.autoindent = true              -- Copy indent from current line when starting a new line.
vim.opt.smartindent = true             -- Attempt to autoindent when starting a new line.
vim.opt.smarttab = true                -- Use shiftwidth rather than tabstop at start of line.
vim.opt.tabstop = 2                    -- Number of spaces per tab.
vim.opt.shiftwidth = 2                 -- Number of spaces for each step of autoindent.
vim.opt.softtabstop = 2                -- Number of spaces per tab when editing.
vim.opt.expandtab = true               -- Insert spaces in place of tabs.

-- Don't show warnings, errors, etc. by default.
vim.diagnostic.enable(false)

-- Don't try loading non-vimscript/lua plugins.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Use fancy diagnostics icons.
for type, icon in pairs({ Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Set UI options.
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

-- Highlight cursor line only in the active window.
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "WinLeave", "BufLeave" }, {
  callback = function(ev)
    local enable_cursorline = ev.event == "WinEnter" or ev.event == "BufEnter"
    vim.opt_local.cursorline = enable_cursorline
  end
})
