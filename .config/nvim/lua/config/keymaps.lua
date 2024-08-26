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
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>FzfLua grep<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>FzfLua builtin commands<CR>')
vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist() end)

-- Toggle diagnostics.
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true })

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
