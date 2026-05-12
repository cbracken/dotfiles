return {
  cmd = { "beancount-language-server", "--stdio" },
  init_options = {
    journal_file = (function()
      -- Search upwards for main.beancount starting from the current working directory
      local file = vim.fn.findfile('main.beancount', '.;')
      if file ~= '' then
        -- Expand the relative result into a full absolute path
        return vim.fn.fnamemodify(file, ':p')
      end
      return ""
    end)(),
  },
}
