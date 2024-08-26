-- Globals.
vim.g.mapleader=' '                    -- Set <leader> key.

-- Kill arrow keys, for great justice.
vim.keymap.set('n', '<Up>', '<NOP>')
vim.keymap.set('n', '<Down>', '<NOP>')
vim.keymap.set('n', '<Left>', '<NOP>')
vim.keymap.set('n', '<Right>', '<NOP>')

-- In terminal, ESC returns to normal mode.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Retain selection on <,>.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Configure fzf-lua.
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua grep<CR>')
vim.keymap.set('n', '<leader>fl', '<cmd>FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua builtin commands<CR>')
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua lsp_references<CR>')
vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>')

-- Toggle diagnostics.
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Key mapping to toggle absolute/relative numbering.
vim.keymap.set('n', '<leader>n', function()
  local opt = vim.opt
  if opt.number:get() == false then
    opt.number = true
  elseif opt.relativenumber:get() == false then
    opt.relativenumber = true
  else
    opt.relativenumber = false
    opt.number = false
  end
end)
