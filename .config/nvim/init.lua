require('config.options')         -- Core configuration options.
require('config.keymaps')         -- General key mappings.
require('config.snippets')        -- Reusable code snippets.
require('config.projects')        -- Project-specific code.

-- Machine-local keymaps (if they exist).
local local_keymaps_path = vim.fn.expand('~/.local/config/nvim/lua/config/keymaps.lua')
if vim.fn.filereadable(local_keymaps_path) == 1 then
  dofile(local_keymaps_path)
end

require('config.lazy')            -- Package manager.
