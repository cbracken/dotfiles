-- Globals.
vim.g.mapleader=' '                    -- Set <leader> key.

-- Kill arrow keys, for great justice.
vim.keymap.set('n', '<Up>', '<NOP>')
vim.keymap.set('n', '<Down>', '<NOP>')
vim.keymap.set('n', '<Left>', '<NOP>')
vim.keymap.set('n', '<Right>', '<NOP>')

-- In terminal, C-[ (ESC) is passed through to the terminal by default.
-- Remap C-] to return to normal mode like C-[ does by default.
vim.keymap.set('t', '<C-]>', '<C-\\><C-n>')

-- Retain selection on <,>.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Configure netrw.
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.keymap.set('n', '<leader>ee', '<cmd>35Lexplore<CR>')
vim.keymap.set('n', '<leader>ef', '<cmd>35Lexplore %:p:h<CR>')

-- Configure fzf-lua.
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua grep<CR>')
vim.keymap.set('n', '<leader>fl', '<cmd>FzfLua live_grep<CR>')
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua builtin commands<CR>')
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua lsp_references<CR>')
vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>')

-- Toggle diagnostics.
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, {silent = true})

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
