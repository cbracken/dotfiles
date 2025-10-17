local M = {}

function M.change_google3_subdir(subdir)
  return function()
    local cwd = vim.fn.getcwd()
    local google3_pattern = "/google3"
    local google3_start, google3_end = string.find(cwd, google3_pattern, 1, true)

    if google3_start then
      local root = string.sub(cwd, 1, google3_end)
      local new_dir = root .. "/" .. subdir
      if vim.fn.isdirectory(new_dir) == 1 then
        vim.cmd("cd " .. new_dir)
        vim.notify("Changed directory to: " .. new_dir, vim.log.levels.INFO)
      else
        vim.notify("Directory not found: " .. new_dir, vim.log.levels.WARN)
      end
    end
  end
end

return M
