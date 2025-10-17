-- Core configuration options.
require('config.options')

-- General key mappings.
require('config.keymaps')

-- Machine-local keymaps (if they exist).
local local_keymaps_path = vim.fn.expand('~/.local/config/nvim/lua/config/keymaps.lua')
if vim.fn.filereadable(local_keymaps_path) == 1 then
  dofile(local_keymaps_path)
end

-- Colorschemes.
require('config.colorscheme')

-- Reusable code snippets.
require('config.snippets')

-- Project-specific code.
require('config.projects')

-- Package manager.
require('config.lazy')
