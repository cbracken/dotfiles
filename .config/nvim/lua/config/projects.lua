-- Updates the vim path for Flutter engine development.
local function update_path_for_flutter_engine()
  local engine_dir = vim.fn.expand('$HOME/Developer/flutter/engine/src')
  if vim.fn.getcwd():find(engine_dir, 1, true) == 1 then
    vim.opt.path:append(engine_dir)
  end
end

update_path_for_flutter_engine()
