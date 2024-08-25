-- Function to get the current date in 'YYYY-mm-dd (Day)' format
local function get_current_date()
  local fname = vim.fn.expand('%:t:r')
  local date_pattern = '^%d%d%d%d%-%d%d%-%d%d$'
  
  if fname:match(date_pattern) then
    local fdate = vim.fn.strptime('%Y-%m-%d', fname)
    return vim.fn.strftime('%Y-%m-%d (%a)', fdate)
  else
    return vim.fn.strftime('%Y-%m-%d (%a)')
  end
end

-- Key mapping to insert the current date in 'YYYY-mm-dd (Day)' format
vim.keymap.set('n', '<Leader>cd', function()
  local date_str = get_current_date()
  vim.api.nvim_put({date_str}, 'c', true, true)
end)
